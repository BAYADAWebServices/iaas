variable "profile" { 
  default = ""
}

variable "region" {
  default = "us-east-1"
}

variable "transit_gateway_id" { 
  default = ""
}

variable "shared_transit_route_table" { 
  default = ""
}

variable "tgw_route_summary" { 
  default = "10.20.0.0/16"
}

variable "tag_vpc_name" { 
  default = "Shared Services"
}

variable "account_name" {
  default = "shared-services"
}
