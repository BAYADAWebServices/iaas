variable "region" {
	default = "us-east-1"
}

variable "profile" {}

variable "bucket_name" {
	default ="bws-devops-terraform-state-bucket"
}

variable "dynamo_table_name" {
	default ="bws-devops-terraform-lock-table"
}