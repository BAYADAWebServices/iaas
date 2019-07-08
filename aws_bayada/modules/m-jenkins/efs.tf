resource "aws_efs_file_system" "main" {
  tags = "${local.tags}"
}

resource "aws_efs_mount_target" "main" {
  count = "${length(var.subnets_instances)}"
  file_system_id  = "${aws_efs_file_system.main.id}"
  subnet_id       = "${var.subnets_instances[count.index]}"
  security_groups = ["${aws_security_group.efs.id}"]
}
