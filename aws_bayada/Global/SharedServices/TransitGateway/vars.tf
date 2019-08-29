variable "profile" { 
  default = ""
}

variable "region" {
  default = "us-east-1"
}

variable "description" { 
  default = "Bayada Transit Gateway - Non-prod environments"
}

variable "amazon_side_asn" { 
  default = "64512"
}

variable "dns_support" { 
  default = "enable"
}

variable "vpn_ecmp_support" { 
  default = "enable"
}

variable "default_route_table_association" { 
  default = "disable"
}

variable "default_route_table_propagation" { 
  default = "disable"
}

variable "auto_accept_shared_attachments" { 
  default = "enable"
}

variable "allow_external_principals" { 
  default = "false"
}

variable "organization_arn" { 
  default = "arn:aws:organizations::998774749665:organization/o-phlnn6tmy5"
}

variable "account_name" {
  default = "OPSSharedServicesDev"
}





