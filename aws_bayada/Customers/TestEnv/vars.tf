variable "customer_account_profile" {}

variable "shared_services_profile" {
  default = "BWS-OPSSharedServiceDev-FullAdmin"
}

variable "account_name" {}

variable "account_id" {}

variable "key_name" {
  default = "serverkey"
}

variable "vpcsubnet" {}

variable "vpc_owner" {}

variable "region" {
  default = "us-east-1"
}

variable "tgw_route_summary" { 
  default = "10.20.0.0/16"
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

variable "ami_web1" {
  default = "ami-082054f7d9443561f"
}

variable "ami_web2" {
  default = "ami-082054f7d9443561f"
}

variable "ami_db1" {
  default = "ami-0e329312d0e3c5597"
}

variable "ami_db2" {
  default = "ami-01a62bf224e0696c6"
}

variable "ami_dc1" {
  default = "ami-02e71d2b3a4a2a409"
}

variable "ami_rdp1" {
  default = "ami-0ad4ef84bc9427b85"
}

variable "web1_instance_size" {
  default = "t3.medium"
}

variable "web2_instance_size" {
  default = "t3.medium"
}

variable "db1_instance_size" {
  default = "t3.medium"
}

variable "db2_instance_size" {
  default = "t3.medium"
}

variable "dc1_instance_size" {
  default = "t3.medium"
}

variable "rdp1_instance_size" {
  default = "t3.small"
}