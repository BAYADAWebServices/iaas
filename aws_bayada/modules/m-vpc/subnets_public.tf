resource "aws_subnet" "public" {

  count = "${var.subnet_map["public"]}"

  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${cidrsubnet(var.cidr_block, var.newbits["public"], count.index + var.netnum_shift_map["public"])}"

  availability_zone       = "${element(data.aws_availability_zones.main.names, count.index % var.az_width)}"
  map_public_ip_on_launch = "true"

  tags {
    Name              = "subnet${var.tag_name}-${element(var.subnet_name_suffix, count.index)}-public"
	"bws:Description" = "Subnet IP range for public network"
    "bws:Service"     = "${var.tag_service}"
    "bws:Office"      = "${var.tag_office}"
    "bws:Environment" = "${var.tag_environment}"
    "bws:Customer"    = "${var.tag_customer}"
  }
}
