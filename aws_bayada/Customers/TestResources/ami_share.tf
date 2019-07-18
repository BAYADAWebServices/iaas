resource "aws_ami_launch_permission" "share_ami" {
  image_id   = "${var.ami_id}"
  account_id = "${var.account_id}"
}