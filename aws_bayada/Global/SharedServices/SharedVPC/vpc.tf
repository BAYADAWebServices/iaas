module "vpc" {
   #providers       = "aws.shared_services"
 source         = "../../../modules/m-vpc"
 cidr_block     = "10.20.0.0/24"
 az_width	      = "2"
 nat_instances	= "1"
 newbits {
 	public 		= "3"
 	private 	= "3"
 	isolated 	= "0"
 }
 subnet_map {
    public   	= "2"
    private  	= "2"
    isolated 	= "0"
 }      
 netnum_shift_map {
 	public		= "0"
 	private		= "2"
 	isolated	= "4"
 }
 tag_name           = "${var.tag_vpc_name}"

}

resource "aws_vpc_endpoint" "shared_s3_access" {
    #provider        = "aws.shared_services"
  vpc_id          = "${module.vpc.id}"
  service_name    = "com.amazonaws.us-east-1.s3"
  route_table_ids =["${module.vpc.routes_private}"]
  
  tags = {
    Name = "S3endpointOPSShareServicesDev"
  }
}

resource "aws_main_route_table_association" "Shared_priv_rt" {
    #provider       = "aws.shared_services"
  vpc_id         = "${module.vpc.id}"
  route_table_id = "${module.vpc.routes_private[0]}"
}

resource "aws_route" "tgw_summary_route" {
    #provider                  = "aws.shared_services"
  route_table_id            = "${module.vpc.routes_private[0]}"
  destination_cidr_block    = "${var.tgw_route_summary}"
  transit_gateway_id        = "${var.transit_gateway_id}"
}

resource "aws_route" "tgw_vpn_route" {
    #provider                  = "aws.shared_services"
  route_table_id            = "${module.vpc.routes_private[0]}"
  destination_cidr_block    = "${var.tgw_vpn_route}"
  transit_gateway_id        = "${var.transit_gateway_id}"
}

resource "aws_ec2_transit_gateway_vpc_attachment" "attach_shared_services" {
    #provider                                         = "aws.shared_services"
  subnet_ids         								               = ["${module.vpc.subnets_private}"]
  transit_gateway_id 								               = "${var.transit_gateway_id}"
  vpc_id             								               = "${module.vpc.id}"
  transit_gateway_default_route_table_association  = "false"
  transit_gateway_default_route_table_propagation  = "false"
  
  tags                                             = {
    Name                                           = "tgw_attach_shared_vpc"
  }
}

resource "aws_ec2_transit_gateway_route_table_association" "attach_shared_services_rt" {
    #provider                       = "aws.shared_services"
  transit_gateway_attachment_id  = "${aws_ec2_transit_gateway_vpc_attachment.attach_shared_services.id}"
  transit_gateway_route_table_id = "${var.shared_transit_route_table}"
}

resource "aws_ec2_transit_gateway_route_table_propagation" "tgw_route_shared_to_vpn" {
    #provider                        = "aws.shared_services"
  transit_gateway_attachment_id   = "${var.vpn_attach_id}"
  transit_gateway_route_table_id  = "${var.shared_tgw_rt_id}"
}

resource "aws_ec2_transit_gateway_route_table_propagation" "tgw_route_vpn_to_shared" {
    #provider                        = "aws.shared_services"
  transit_gateway_attachment_id   = "${aws_ec2_transit_gateway_vpc_attachment.attach_shared_services.id}"
  transit_gateway_route_table_id  = "${var.vpn_tgw_rt_id}"
}