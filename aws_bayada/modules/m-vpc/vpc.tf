resource "aws_vpc" "main" {
  cidr_block = "${var.cidr_block}"

  enable_dns_support   = "true"
  enable_dns_hostnames = "true"

  instance_tenancy = "${var.instance_tenancy}"

  tags {
    Name        = "${var.tag_name}"
    CostCenter  = "${var.tag_costcenter}"
    Environment = "${var.tag_environment}"
    Application = "${var.tag_application}"
    Customer    = "${var.tag_customer}"
  }
}
