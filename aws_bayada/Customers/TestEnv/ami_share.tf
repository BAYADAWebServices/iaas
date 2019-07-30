/*
resource "aws_ami_launch_permission" "share_web_ami" {
  provider   = "aws.ses_shared_srvc_dev"
  image_id   = "${var.ami_web1}"
  account_id = "${var.account_id}"
}

resource "aws_ami_launch_permission" "share_db1_ami" {
  provider   = "aws.ses_shared_srvc_dev"
  image_id   = "${var.ami_db1}"
  account_id = "${var.account_id}"
}

resource "aws_ami_launch_permission" "share_db2_ami" {
  provider   = "aws.ses_shared_srvc_dev"
  image_id   = "${var.ami_db2}"
  account_id = "${var.account_id}"
}

resource "aws_ami_launch_permission" "share_dc1_ami" {
  provider   = "aws.ses_shared_srvc_dev"
  image_id   = "${var.ami_dc1}"
  account_id = "${var.account_id}"
}

*/
