variable "tag_service" {
  default = "Enterprise Data and Telecom Networks"
}

variable "tag_office" {
  default = "NES-527"
}

variable "tag_name" {}

variable "tag_customer" {}

variable "tag_environment" {}

variable "tag_application" {
  default = ""
}

variable "owner" {
  default = "support@bayadawebservices.com"
}

variable "adminip" {
  default = "172.0.0.1"
}

variable "az_width" {
  default = "3"
}

variable "cidr_block" {
  default = "10.0.0.0/16"
}

variable "instance_tenancy" {
  default = "default"
}

variable "nat_instances" {
  default = "3"
}

variable "netnum_shift_map" {
  description = <<EOF
This var controls the shift in subnet creation
between the three basic subnet-types.
EOF

  type = "map"

  default = {
    public   = "0"
    private  = "9"
    isolated = "18"
  }
}

variable "newbits" {
  description = <<EOF
This controls subnet size.
Default is 5, which against a /16 give a subnet size of /21 with 2045 addresses.
EOF

  type = "map"

  default = {
    public   = 5
    private  = 5
    isolated = 5
  }
}

variable "subnet_map" {
  type = "map"

  default = {
    public   = "3"
    private  = "3"
    isolated = "3"
  }
}

variable "subnet_name_suffix" {
  default = [""]
}

variable "enable_flow_logs" {
  default = false
}

variable "flow_log_bucket" {
  default = ""
}

variable "flow_log_bucket_exists" {
  default = false
}
