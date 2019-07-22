resource "aws_eip" "nat" {
  count = "${var.nat_instances}"
  vpc   = "true"


  tags {
    Name        = "${var.tag_name}"
    CostCenter  = "${var.tag_costcenter}"
    Environment = "${var.tag_environment}"
    Application = "${var.tag_application}"
    Customer    = "${var.tag_customer}"
  }
}

resource "aws_nat_gateway" "main" {
  count = "${var.nat_instances}"

  
  allocation_id = "${element(aws_eip.nat.*.id, count.index)}"
  subnet_id     = "${element(aws_subnet.public.*.id, count.index)}"
  depends_on    = ["aws_internet_gateway.main"]

  tags {
    Name        = "${var.tag_name}"
    CostCenter  = "${var.tag_costcenter}"
    Environment = "${var.tag_environment}"
    Application = "${var.tag_application}"
    Customer    = "${var.tag_customer}"
  }
}
