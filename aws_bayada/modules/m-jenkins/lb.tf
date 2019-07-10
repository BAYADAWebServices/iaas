data "aws_acm_certificate" "main" {
  domain = "${var.r53_zone_name}"
  most_recent = true
}

resource "random_id" "lb" {
  byte_length = 4
  keepers = {
    launch_config = "${aws_launch_configuration.main.name}"
  }
}

resource "aws_lb" "main" {
  name               = "${local.app_name}-${random_id.lb.hex}"
  internal           = "${var.lb_internal}"
  load_balancer_type = "application"
  security_groups    = ["${aws_security_group.elb.id}"]
  subnets            = ["${var.subnets_elb}"]
  tags               = "${local.tags}"
}

resource "aws_lb_listener" "443" {
  load_balancer_arn = "${aws_lb.main.arn}"
  port              = "${var.lb_instance_port_https}"
  protocol          = "HTTPS"
  ssl_policy        = "${var.ssl_policy}"
  certificate_arn   = "${data.aws_acm_certificate.main.arn}"

  default_action {
    target_group_arn = "${aws_lb_target_group.443.arn}"
    type             = "forward"
  }
}

resource "aws_lb_target_group" "443" {
  name     = "${local.app_name}-443-${random_id.lb.hex}"
  port     = "${var.lb_instance_port_https}"
  protocol = "HTTPS"
  vpc_id   = "${var.vpc_id}"

  health_check {
    path     = "${var.lb_healthcheck_target}"
    matcher  = "${var.lb_healthcheck_response_https}"
    protocol = "HTTPS"
    timeout  = "${var.lb_healthcheck_timeout}"
    interval = "${var.lb_healthcheck_interval}"
    healthy_threshold   = "${var.lb_healthy_threshold}"
    unhealthy_threshold = "${var.lb_unhealthy_threshold}"
  }

  lifecycle {
    create_before_destroy = "true"
  }
}

resource "aws_lb_target_group" "80" {
  name        = "${local.app_name}-80-${random_id.lb.hex}"
  port        = "${var.lb_instance_port_http}"
  protocol    = "HTTP"
  vpc_id      = "${var.vpc_id}"

  health_check {
    path     = "${var.lb_healthcheck_target}"
    matcher  = "${var.lb_healthcheck_response_http}"
    protocol = "HTTP"
    timeout  = "${var.lb_healthcheck_timeout}"
    interval = "${var.lb_healthcheck_interval}"
    healthy_threshold   = "${var.lb_healthy_threshold}"
    unhealthy_threshold = "${var.lb_unhealthy_threshold}"
  }

  lifecycle {
    create_before_destroy = "true"
  }
}

resource "aws_lb_listener" "80" {
  load_balancer_arn = "${aws_lb.main.arn}"
  port              = "${var.lb_instance_port_http}"
  protocol          = "HTTP"

  default_action {
    target_group_arn = "${aws_lb_target_group.80.arn}"
    type             = "forward"
  }
}
