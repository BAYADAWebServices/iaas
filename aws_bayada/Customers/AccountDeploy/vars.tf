variable "profile" { 
  	default = ""
}

variable "region" {
  	default = "us-east-1"
}

variable "account_name" {}

variable "account_email" {}

variable "account_admin_role" {}

variable "ou_parent_id" {
  default = "ou-iult-r99p83wv"
}

variable "bucket_name" {
	default ="bws-devops-terraform-state-bucket"
}

variable "dynamo_table_name" {
	default ="bws-devops-terraform-lock-table"
}