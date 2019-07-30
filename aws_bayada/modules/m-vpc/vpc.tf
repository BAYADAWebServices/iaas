resource "aws_vpc" "main" {
  cidr_block = "${var.cidr_block}"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"

  instance_tenancy = "${var.instance_tenancy}"

  tags {
    Name              = "vpc${var.tag_name}"
	"bws:Description" = "Virtual private cloud for a specified CIDR block"
    "bws:Service"     = "${var.tag_service}"
    "bws:Office"      = "${var.tag_office}"
    "bws:Environment" = "${var.tag_environment}"
    "bws:Customer"    = "${var.tag_customer}"
  }
}
