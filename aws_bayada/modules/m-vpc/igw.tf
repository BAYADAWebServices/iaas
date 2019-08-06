resource "aws_internet_gateway" "main" {

  vpc_id = "${aws_vpc.main.id}"

  tags {
    Name              = "ig${var.tag_name}"
	"bws:Description" = "Internet Gateway endpoint for resources in the public subnet"
    "bws:Service"     = "${var.tag_service}"
    "bws:Office"      = "${var.tag_office}"
    "bws:Environment" = "${var.tag_environment}"
    "bws:Customer"    = "${var.tag_customer}"
  }
}
