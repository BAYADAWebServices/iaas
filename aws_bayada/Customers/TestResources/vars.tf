variable "customer_account_profile" {}

Variable "shared_services_profile" {}

variable "account_name" {}

variable "account_id" {}

variable "region" {
  default = "us-east-1"
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
  default = t3.medium"
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

variable "web1_volume_size_root" {
  default = "40"
}

variable "web2_volume_size_root" {
  default = "40"
}

variable "db1_volume_size_root" {
  default = "40"
}

variable "db2_volume_size_root" {
  default = "40"
}

variable "dc1_volume_size_root" {
  default = "40"
}

variable "rdp1_volume_size_root" {
  default = "40"
}
