variable "customer_account_profile" {}

variable "account_name" {}

variable "account_id" {}

variable "vpcsubnet" {}

variable "vpc_owner" {}

variable "customer_name" {}

variable "environment" {}

variable "puppet_ip" {}

variable "puppet-interval" {
	default = "60"
}

variable "puppet-log-level" {
	default = "debug"
}

variable "puppet-env" {
	default = "devtest"
}

variable "bayapp" {}

variable "bucket_name" {
	default ="bws-devops-terraform-state-bucket"
}

variable "dynamo_table_name" {
	default ="bws-devops-terraform-lock-table"
}

variable "web1_name" {
	default = "WEBAPP01"
}

variable "web2_name" {
	default = "WEBAPP02"
}
variable "dc1_name" {
	default = "BAYADDC01"
}

variable "db1_name" {
	default = "PORTALSQ01"
}

variable "db2_name" {
	default = "GP2010SQC01"
}

variable "rdp1_name" {
	default = "RDP01"
}

variable "internal_dns" {
	default = ".bws.cloud"
}

variable "admin_password" {
	default = "BAyaDanurseS1975"
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
   default = "tgw-attach-0ea1331ea99d33ec7"
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