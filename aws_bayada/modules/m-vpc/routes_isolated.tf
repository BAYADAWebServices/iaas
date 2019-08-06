/*
resource "aws_default_route_table" "isolated" {

  default_route_table_id = "${aws_vpc.main.default_route_table_id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.main.id}"
  }

  tags = {
    Name = "rt${var.tag_name}-isolated"
	"bws:Description" = "Default route table for isolated subnet"
    "bws:Service"     = "${var.tag_service}"
    "bws:Office"      = "${var.tag_office}"
    "bws:Environment" = "${var.tag_environment}"
    "bws:Customer"    = "${var.tag_customer}"
  }
}
*/

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
