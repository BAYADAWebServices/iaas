resource "aws_s3_bucket" "terraform" {
  bucket = "${var.account_name}-terraform-${var.region}"
  acl    = "private"

  tags {
    Name        = "Terraform Remote State"
  }
}
