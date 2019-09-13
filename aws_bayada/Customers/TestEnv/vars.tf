variable "account_name" {}

variable "key_pair" {
  default = "testpair"
}

variable "vpc_subnet" {}

variable "user_env" {}

variable "access_key" {}

variable "secret_key" {}

variable "shared_role" {
  default = "arn:aws:iam::538477515645:role/BWS-OPSSharedServiceDev-FullAdmin"
}

variable "ses_shared_role" {
  default = "arn:aws:iam::764320393679:role/BWS-SESSharedServiceNonProd-FullAdmin"
}

variable "customer_role" {}

variable "account_id" {}

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

variable "shared_acct_name" {
  default = "bws-ops-shared-dev"
}

variable "shared_tgw_rt_id" {
   default = "tgw-rtb-072cdfdcdf6f7d76b"
}

variable "shared_tgw_attach_id" {
   default = "tgw-attach-0ea1331ea99d33ec7"
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
  default = "ami-004ecaf901a994f35"
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