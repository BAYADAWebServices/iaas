resource "aws_s3_bucket" "terraform" {
  bucket = "${lower(var.account_name_friendly)}-terraform-remote-state"
  acl    = "private"

  tags {
    Name              = "${var.account_name_friendly}-terraform-remote-state"
	"bws:Application" = "Terraform"
	"bws:Owner"       = "SES"
	"bws:Service"     = "Enterprise Servers and Data Storage"
  }
}
