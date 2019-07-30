resource "aws_eip" "nat" {
  count = "${var.nat_instances}"
  vpc   = "true"


  tags {
    Name              = "eip${var.tag_name}"
	"bws:Description" = "Public IP address - static"
    "bws:Service"     = "${var.tag_service}"
    "bws:Office"      = "${var.tag_office}"
    "bws:Environment" = "${var.tag_environment}"
    "bws:Customer"    = "${var.tag_customer}"
  }
}

resource "aws_nat_gateway" "main" {
  count = "${var.nat_instances}"

  
  allocation_id = "${element(aws_eip.nat.*.id, count.index)}"
  subnet_id     = "${element(aws_subnet.public.*.id, count.index)}"
  depends_on    = ["aws_internet_gateway.main"]

  tags {
    Name              = "nat${var.tag_name}"
	"bws:Description" = "NAT Gateway endpoint for resources in the private subnet to communicate with the Internet without having a public IP address"
    "bws:Service"     = "${var.tag_service}"
    "bws:Office"      = "${var.tag_office}"
    "bws:Environment" = "${var.tag_environment}"
    "bws:Customer"    = "${var.tag_customer}"
  }
}
