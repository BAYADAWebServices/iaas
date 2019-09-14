
variable "shared_r53_profile" {
  default = "BWS-SESSharedServiceNonProd-FullAdmin"
}

variable "shared_services_profile" {
  default = "BWS-OPSSharedServiceDev-FullAdmin"
}


variable "region" {
  default = "us-east-1"
}

variable "transit_gateway_id" { 
  default = "tgw-026f34280a5ac6dd0"
}

variable "shared_transit_route_table" { 
  default = "tgw-rtb-072cdfdcdf6f7d76b"
}

variable "shared_tgw_rt_id" {
   default = "tgw-rtb-072cdfdcdf6f7d76b"
}

variable "vpn_attach_id" {
  default = "tgw-attach-0faa2eb1e719aa323"
}

variable "vpn_tgw_rt_id" {
   default = "tgw-rtb-003fcf0fb8f40b369"
}

variable "tgw_route_summary" { 
  default = "10.20.0.0/16"
}

variable "tgw_vpn_route" { 
  default = "192.168.240.0/22"
}

variable "tag_vpc_name" { 
  default = "vpcOpsSharedServicesDev"
}

variable "account_name" {
  default = "OPSSharedServicesDev"
}

variable "jenkins_key_pair" {
	default = "jenkins"
}

