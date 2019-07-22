resource "aws_subnet" "private" {
  count = "${var.subnet_map["private"]}"

  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${cidrsubnet(var.cidr_block, var.newbits["private"], count.index + var.netnum_shift_map["private"])}"

  availability_zone       = "${element(data.aws_availability_zones.main.names, count.index % var.az_width)}"
  map_public_ip_on_launch = "false"

  tags {
    Name        = "${var.tag_name}-${element(var.subnet_name_suffix, count.index)}-private"
    CostCenter  = "${var.tag_costcenter}"
    Environment = "${var.tag_environment}"
    Application = "${var.tag_application}"
    Customer    = "${var.tag_customer}"
  }
}
