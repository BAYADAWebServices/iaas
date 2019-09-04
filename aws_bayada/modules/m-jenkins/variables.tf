variable "subnets_elb" {
  description = "Subnets (probably public) for the load balancer"
  type = "list"
}
variable "subnets_instances" {
  description = "Subnets (probably private) for EC2 instances"
  type = "list"
}
variable "vpc_id" {
  description = "The VPC to deploy Jenkins"
}
variable "r53_zone_name" {
  description = "Route53 zone to use for DNS"
}
variable "key_name" {
  description = "EC2 keypair name for instances"
}

variable "app_name" {
  default = "jenkins"
}

variable "subdomain" {
  default = ""
  description = "(optional) The name of the new subdomain to create. If not provided, defaults to '<env>-jenkins'"
}

variable "environment" {
  default = "testenv"
  description = "(optional) Platform environment (e.g. dev/stg/prod)"
}

variable "costcenter" {
  default = ""
  description = "Cost center for tagging"
}

variable "sg_additional" {
  default = ""
  description = "Additional security group to apply to instances (e.g. for Bastion SSH access)"
}

variable "asg_max" {
  description = "The number of servers to deploy. For now this is one but we could change this to assist in scaling in future versions."
  default     = "1"
}

variable "asg_min" {
  description = "The number of servers to deploy. For now this is one but we could change this to assist in scaling in future versions."
  default     = "1"
}

variable "asg_desired" {
  default = "1"
}

variable "tenancy" {
  default = "default"
  description = "(optional) EC2 instance tenancy (default or dedicated)"
}

variable "ami" {
  description = "(optional) AMI to use in place of the default (default is a lookup)"
  default     = ""
}

variable "ami_description" {
  default = "CentOS Linux 7 x86_64 HVM EBS*"
  description = "(optional) AMI name regex to use for instances (default is CentOS)"
}

variable "ami_owner" {
  default = "679593333241"
  description = "(optional) AMI owner ID (default is AWS)"
}

variable "termination_policies_list" {
  default = ["Default"]
}

variable "asg_grace_period" {
  default = "300"
}

variable "asg_check_type" {
  default = "ELB"
}

variable "asg_capacity_timeout" {
  default = "10m"
}

variable "instance_type" {
  default = "m4.large"
}

variable "append_script" {
  default = ""
}

variable "lb_internal" {
  default = "true"
}

variable "lb_instance_port_http" {
  default = "80"
}

variable "lb_instance_port_https" {
  default = "443"
}

variable "lb_healthcheck_target" {
  default = "/login"
}

variable "lb_healthcheck_response_http" {
  default = "301"
}

variable "lb_healthcheck_response_https" {
  default = "200"
}

variable "lb_healthy_threshold" {
  default = "3"
}

variable "lb_unhealthy_threshold" {
  default = "3"
}

variable "lb_healthcheck_interval" {
  default = "30"
}

variable "lb_healthcheck_timeout" {
  default = "5"
}

variable "ports_ingress_instance" {
  default = ["80", "443"]
}

variable "ports_ingress_elb" {
  default = ["80", "443"]
}

variable "cidrs_ingress_elb" {
  default = ["0.0.0.0/0"]
  description = "CIDR range for ingress to the LB. Default is world (0.0.0.0/0)"
}

variable "ssl_key" {
  default = ""
  description = "(optional) SSL key for HTTPS from LB to ASG (default is terraform-generated)"
}
variable "ssl_cert" {
  default = ""
  description = "(optional) SSL certificate for HTTPS from LB to ASG (default is terraform-generated)"
}

variable "ssl_policy" {
  default = "ELBSecurityPolicy-2016-08"
}

locals {
  app_name            = "${var.environment}-${lower(var.app_name)}"
  subdomain           = "${var.subdomain == "" ? local.app_name : var.subdomain}"
  ssl_cert            = "${var.ssl_cert == "" ? tls_self_signed_cert.jenkins.cert_pem : var.ssl_cert}"
  ssl_key             = "${var.ssl_key == "" ? tls_private_key.jenkins.private_key_pem : var.ssl_key}"
  all_subnets         = "${distinct(data.aws_subnet_ids.all.*.id)}"
  ami                 = "${var.ami != "" ? var.ami : data.aws_ami.main.id}"

  tags = {
    Terraform   = true
    CostCenter  = "${var.costcenter}"
    Environment = "${var.environment}"
    Application = "${local.app_name}"
    Name        = "${local.app_name}"
  }

  instance_tags = [
    {
      key                 = "Terraform"
      value               = true
      propagate_at_launch = true
    },
    {
      key                 = "CostCenter"
      value               = "${var.costcenter}"
      propagate_at_launch = true
    },
    {
      key                 = "Environment"
      value               = "${var.environment}"
      propagate_at_launch = true
    },
    {
      key                 = "Application"
      value               = "${local.app_name}"
      propagate_at_launch = true
    },
    {
      key                 = "Name"
      value               = "${local.app_name}"
      propagate_at_launch = true
    }
  ]
}
