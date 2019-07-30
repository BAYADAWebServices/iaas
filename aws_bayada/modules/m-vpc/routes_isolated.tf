resource "aws_route_table" "isolated" {

  vpc_id = "${aws_vpc.main.id}"

  tags {
    Name              = "rt${var.tag_name}-isolated"
	"bws:Description" = "Route table for isolated subnet"
    "bws:Service"     = "${var.tag_service}"
    "bws:Office"      = "${var.tag_office}"
    "bws:Environment" = "${var.tag_environment}"
    "bws:Customer"    = "${var.tag_customer}"
  }
}

resource "aws_route_table_association" "isolated" {

  count = "${var.subnet_map["isolated"]}"

  subnet_id      = "${element(aws_subnet.isolated.*.id, count.index)}"
  route_table_id = "${aws_route_table.isolated.id}"
}
