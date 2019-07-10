variable "profile" { 
  default = ""
}

variable "region" {
  default = "us-east-1"
}

variable "vpcsubnet" {
	default = ""
}

variable "customer_name" { 
  default = "SQA"
}

variable "transit_gateway_id" { 
  default = "tgw-026f34280a5ac6dd0"
}

variable "tgw_route_summary" { 
  default = "10.20.0.0/16"
}

