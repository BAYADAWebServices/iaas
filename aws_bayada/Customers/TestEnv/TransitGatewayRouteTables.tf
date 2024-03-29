resource "aws_ec2_transit_gateway_route_table" "tgw-customer-rt" {
  provider            = "aws.shared_services"
  transit_gateway_id  = "${var.transit_gateway_id}"
  tags                = {
    Name              = "${var.account_name}-${var.user_env}"
  }
}

resource "aws_ec2_transit_gateway_route_table_association" "tgw_attach_cust_rt" {
  provider                        = "aws.shared_services"
  transit_gateway_attachment_id   = "${aws_ec2_transit_gateway_vpc_attachment.tgw_attach_cust_vpc.id}"
  transit_gateway_route_table_id  = "${aws_ec2_transit_gateway_route_table.tgw-customer-rt.id}"

}

resource "aws_ec2_transit_gateway_route_table_propagation" "tgw_route_shared_to_cust" {
  provider                        = "aws.shared_services"
  transit_gateway_attachment_id   = "${aws_ec2_transit_gateway_vpc_attachment.tgw_attach_cust_vpc.id}"
  transit_gateway_route_table_id  = "${var.shared_tgw_rt_id}"
}

resource "aws_ec2_transit_gateway_route_table_propagation" "tgw_route_cust_to_shared" {
  provider                        = "aws.shared_services"
  transit_gateway_attachment_id   = "${var.shared_tgw_attach_id}"
  transit_gateway_route_table_id  = "${aws_ec2_transit_gateway_route_table.tgw-customer-rt.id}"
}

resource "aws_ec2_transit_gateway_route_table_propagation" "tgw_route_cust_to_vpn" {
  provider                        = "aws.shared_services"
  transit_gateway_attachment_id   = "${var.vpn_attach_id}"
  transit_gateway_route_table_id  = "${aws_ec2_transit_gateway_route_table.tgw-customer-rt.id}"
}

resource "aws_ec2_transit_gateway_route_table_propagation" "tgw_route_vpn_to_cust" {
  provider                        = "aws.shared_services"
  transit_gateway_attachment_id   = "${aws_ec2_transit_gateway_vpc_attachment.tgw_attach_cust_vpc.id}"
  transit_gateway_route_table_id  = "${var.vpn_tgw_rt_id}"
}