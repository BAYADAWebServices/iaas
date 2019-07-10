data "aws_ami" "main" {
  most_recent = true
  owners = ["${var.ami_owner}"]
  filter {
    name   = "name"
    values = ["${var.ami_description}"]
  }
}
resource "random_id" "web" {
  keepers = {
    launch_config = "${aws_launch_configuration.main.name}"
  }
  byte_length = 4
}

data "external" "plugins" {
  program = ["${path.module}/templates/cat_plugins.sh"]
}

data "template_file" "user_data" {
  template = "${file("${path.module}/templates/user_data.sh")}"
  vars {
    append_script = "${var.append_script}"
    efs_id        = "${aws_efs_file_system.main.id}"
    ssl_cert      = "${local.ssl_cert}"
    ssl_key       = "${local.ssl_key}"
    plugins       = "${data.external.plugins.result.plugins}"
  }
}

resource "aws_launch_configuration" "main" {
  name_prefix          = "${local.app_name}-"
  image_id             = "${local.ami}"
  instance_type        = "${var.instance_type}"
  placement_tenancy    = "${var.tenancy}"
  iam_instance_profile = "${aws_iam_instance_profile.main.id}"
  security_groups      = ["${aws_security_group.instance.id}", "${var.sg_additional}"]
  user_data            = "${data.template_file.user_data.rendered}"
  key_name             = "${var.key_name}"
  lifecycle {
    create_before_destroy = "true"
  }
  root_block_device {
    delete_on_termination = "true"
  }
}

resource "aws_autoscaling_group" "main" {
  name_prefix = "${local.app_name}-"
  max_size                  = "${var.asg_max}"
  min_size                  = "${var.asg_min}"
  desired_capacity          = "${var.asg_desired}"
  launch_configuration      = "${random_id.web.keepers["launch_config"]}"
  health_check_grace_period = "${var.asg_grace_period}"
  health_check_type         = "${var.asg_check_type}"
  target_group_arns         = [
    "${aws_lb_target_group.80.arn}",
    "${aws_lb_target_group.443.arn}",
  ]
  vpc_zone_identifier       = ["${var.subnets_instances}"]
  wait_for_capacity_timeout = "0"
  termination_policies      = ["ClosestToNextInstanceHour"]
  tags                      = "${local.instance_tags}"

  lifecycle {
    create_before_destroy = "true"
    ignore_changes        = ["max_size", "min_size", "desired_capacity"]
  }
}
