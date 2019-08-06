variable "customer_account_profile" {}

variable "account_name" {}

variable "account_id" {}

variable "vpcsubnet" {}

variable "vpc_owner" {}

variable "customer_name" {}

variable "environment" {}

variable "web1_name" {
	default = "WEBAPP01"
}

variable "admin_password" {
	default = "B@y@d@nurse$1975"
}

variable "instance_scheduler" {
	default = "RunTime-BusinessHours"
}

variable "nes_service" {
  default = "Enterprise Data and Telecom Networks"
}

variable "nes_office" {
  default = "NES-527"
}

variable "ses_service" {
  default = "Enterprise Data and Telecom Networks"
}

variable "ses_office" {
  default = "SES-528"
}

variable "ops_shared_srvc_dev_profile" {
  default = "BWS-OPSSharedServiceDev-FullAdmin"
}

variable "ses_shared_srvc_dev_profile" {
  default = "BWS-SESSharedServiceNonProd-FullAdmin"
}

variable "shared_acct_name" {
  default = "bws-ops-shared-dev"
}

variable "key_name" {
  default = "kpInstanceKey"
}

variable "region" {
  default = "us-east-1"
}

variable "default_route" { 
  default = "0.0.0.0/0"
}

variable "transit_gateway_id" { 
  default = "tgw-026f34280a5ac6dd0"
}

variable "vpn_attach_id" {
  default = "tgw-attach-0faa2eb1e719aa323"
}

variable "vpn_tgw_rt_id" {
   default = "tgw-rtb-003fcf0fb8f40b369"
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