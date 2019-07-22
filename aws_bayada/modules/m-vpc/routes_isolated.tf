resource "aws_route_table" "isolated" {

  vpc_id = "${aws_vpc.main.id}"

  tags {
    Name        = "${var.tag_name}-isolated"
    CostCenter  = "${var.tag_costcenter}"
    Environment = "${var.tag_environment}"
    Application = "${var.tag_application}"
    Customer    = "${var.tag_customer}"
  }
}

resource "aws_route_table_association" "isolated" {

  count = "${var.subnet_map["isolated"]}"

  subnet_id      = "${element(aws_subnet.isolated.*.id, count.index)}"
  route_table_id = "${aws_route_table.isolated.id}"
}
