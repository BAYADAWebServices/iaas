variable "profile" { 
  default = ""
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

variable "tgw_route_summary" { 
  default = "10.20.0.0/16"
}

variable "tgw_vpn_route" { 
  default = "192.168.240.0/22"
}

variable "tag_vpc_name" { 
  default = "Shared Services"
}

variable "account_name" {
  default = "bws-ops-shared-dev"
}




