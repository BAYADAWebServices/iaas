resource "aws_ec2_transit_gateway" "Bayada_Transit" {
	description                     = "${var.description}"
	amazon_side_asn                 = "${var.amazon_side_asn}"
	dns_support                     = "${var.dns_support}"
	vpn_ecmp_support                = "${var.vpn_ecmp_support}"
	default_route_table_association = "${var.default_route_table_association}"
	default_route_table_propagation = "${var.default_route_table_propagation}"
	auto_accept_shared_attachments  = "${var.auto_accept_shared_attachments}"
	  tags                          = {
    Name                          = "tgw${var.account_name}"
  }
}

resource "aws_ram_resource_share" "Bayada_Org_Share" {
  name                      = "Bayada_Org_Share"
  allow_external_principals = "${var.allow_external_principals}"
}

resource "aws_ram_principal_association" "Bayada_Org_Association" {
  principal          = "${var.organization_arn}"
  resource_share_arn = "${aws_ram_resource_share.Bayada_Org_Share.arn}"
}

resource "aws_ram_resource_association" "Bayada_gw_associataion" {
  resource_arn       = "${aws_ec2_transit_gateway.Bayada_Transit.arn}"
  resource_share_arn = "${aws_ram_resource_share.Bayada_Org_Share.arn}"
}

resource "aws_ec2_transit_gateway_route_table" "tgw-shared-rt" {
  transit_gateway_id = "${aws_ec2_transit_gateway.Bayada_Transit.id}"
  tags               = {
    Name             = "tgwRouteTable${var.account_name}"
  }
  depends_on = ["aws_ec2_transit_gateway.Bayada_Transit"]
}