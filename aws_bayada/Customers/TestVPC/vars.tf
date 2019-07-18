variable "customer_account_profile" {}

Variable "shared_services_profile" {}

variable "account_name" {}

variable "sharedalias" {
	default = "shared_services"
}
variable "region" {
  default = "us-east-1"
}

variable "tgw_route_summary" { 
  default = "10.20.0.0/16"
}

variable "vpcsubnet" {}


variable "s3bucket" {
	default = 
}

variable "transit_gateway_id" { 
  default = "tgw-026f34280a5ac6dd0"
}

variable "shared_acct_name" {
  default = "bws-ops-shared-dev"
}

variable "shared_tgw_rt_id" {
   default = "tgw-rtb-072cdfdcdf6f7d76b"
}

variable "shared_tgw_attach_id" {
   default = "tgw-attach-0491837b2202e63bc"
}

 