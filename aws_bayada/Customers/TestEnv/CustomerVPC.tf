module "vpc" {
 source        = "../../modules/m-vpc"
 providers = {
  aws = "aws.customer_account"
}
 cidr_block     = "${var.vpc_subnet}"
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
 tag_name           = "${var.account_name}-${var.userenv}"

}

resource "aws_vpc_endpoint" "testenv_s3_access" {
  provider        = "aws.customer_account"
  vpc_id          = "${module.vpc.id}"
  service_name    = "com.amazonaws.us-east-1.s3"
  route_table_ids =["${module.vpc.routes_isolated}"]
}

resource "aws_main_route_table_association" "cust_priv_rt" {
  provider        = "aws.customer_account"
  vpc_id          = "${module.vpc.id}"
  route_table_id = "${module.vpc.routes_isolated[0]}"
}


resource "aws_route" "tgw_default_route" {
  provider                  = "aws.customer_account"
  route_table_id            = "${module.vpc.routes_isolated[0]}"
  destination_cidr_block    = "${var.default_route}"
  transit_gateway_id        = "${var.transit_gateway_id}"
}

resource "aws_ec2_transit_gateway_vpc_attachment" "tgw_attach_cust_vpc" {
  provider                                         = "aws.customer_account"
  subnet_ids         							                 = ["${module.vpc.subnets_isolated}"]
  transit_gateway_id 							                 = "${var.transit_gateway_id}"
  vpc_id             							                 = "${module.vpc.id}"
  transit_gateway_default_route_table_association  = "false"
  transit_gateway_default_route_table_propagation  = "false"
  tags                                             = {
    Name                                           = "${var.account_name}-${var.userenv}"
  }
}


