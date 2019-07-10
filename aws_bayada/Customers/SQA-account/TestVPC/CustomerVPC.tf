module "vpc" {
 source        = "../../../Modules/m-vpc"
 cidr_block     = "${var.vpcsubnet}"
 az_width	    = "1"
 nat_instances	= "0"
 newbits {
 	public 		= "1"
 	private 	= "0"
 	isolated 	= "1"
 }
 subnet_map {
    public   	= "1"
    private  	= "0"
    isolated 	= "1"
 }      
 netnum_shift_map {
 	public		= "0"
 	private		= "2"
 	isolated	= "1"
 }
 tag_name           = "${var.customer_name}"

}

resource "aws_vpc_endpoint" "testenv_s3_access" {
  vpc_id       = "${module.vpc.id}"
  service_name = "com.amazonaws.us-east-1.s3"
  route_table_ids =["${module.vpc.routes_isolated}"]
}

resource "aws_main_route_table_association" "cust_priv_rt" {
  vpc_id         = "${module.vpc.id}"
  route_table_id = "${module.vpc.routes_isolated[0]}"
}


resource "aws_route" "tgw_default_route" {
  route_table_id            = "${module.vpc.routes_isolated[0]}"
  destination_cidr_block    = "${var.tgw_route_summary}"
  transit_gateway_id        = "${var.transit_gateway_id}"
}

resource "aws_ec2_transit_gateway_vpc_attachment" "tgw_attach_cust_vpc" {
  subnet_ids         							   = ["${module.vpc.subnets_isolated}"]
  transit_gateway_id 							   = "${var.transit_gateway_id}"
  vpc_id             							   = "${module.vpc.id}"
  transit_gateway_default_route_table_association  = "false"
  transit_gateway_default_route_table_propagation  = "false"
  tags                                             = {
    Name                                           = "${var.customer_name}"
  }
}


