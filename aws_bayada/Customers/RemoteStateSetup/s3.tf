resource "aws_s3_bucket" "terraform" {
  bucket = "${var.bucket_name}"
  acl    = "private"
  region = "${var.region}"
  
  tags {
    Name        = "Terraform Remote State"
  }
}
