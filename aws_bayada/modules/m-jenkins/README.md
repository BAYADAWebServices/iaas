# m-jenkins
This repo contains a [Terraform module](https://www.terraform.io/docs/modules/usage.html) to deploy [Jenkins](https://jenkins-ci.org).

---
[LICENSE](./LICENSE.md)
---


## Usage

```
module "jenkins" {
    source = "git::ssh://git-codecommit.us-east-1.amazonaws.com/v1/repos/m-jenkins"
    subnets_elb = "${module.aws_vpc.subnets_public}"
    subnets_instances = "${module.aws_vpc.subnets_private}"
    vpc_id = "${module.aws_vpc.id}"
    key_name = "yours"
    costcenter = "me@example.com"
    r53_zone_name = "example.com"
}
```

### Plugins

Jenkins plugins can be provided via a simple `plugins.txt` file in your working directory. If present, the launch config will include that contents and Jenkins will install the plugins listed. The contents should be newline-separated plugin names. Basically, the output from a JSON API query as described here: https://technologyconversations.com/2017/06/16/automating-jenkins-docker-setup/

    curl -s -k "http://admin:admin@localhost:8080/pluginManager/api/json?depth=1" \ | jq -r '.plugins[].shortName'

# Notes

We're using the official CentOS image, which requires accepting the [terms of service](https://aws.amazon.com/marketplace/pp?sku=aw0evgkw8e5c1q413zgy5pjce). Until this is done, instances will not launch in the ASG, failing with:

    In order to use this AWS Marketplace product you need to accept terms and subscribe.

Currently this module deploys to an AWS cloud environment and built with many of the recommendation in Amazon's whitepaper [Jenkins on AWS (May 2017)](https://d0.awsstatic.com/whitepapers/DevOps/Jenkins_on_AWS.pdf). Future versions might be deployable to other cloud providers and scheduler systems.

Additonally, the [variables.tf](variables.tf) file exposes a number of options which someone using this module can alter many default settings to match requirements of a given project.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| acm_name | AWS Certificate Manager name (defaults to r53_zone_name) | string | `` | no |
| ami | (optional) AMI to use in place of the default (default is a lookup) | string | `` | no |
| ami_description | (optional) AMI name regex to use for instances (default is CentOS) | string | `CentOS Linux 7 x86_64 HVM EBS*` | no |
| ami_owner | (optional) AMI owner ID (default is AWS) | string | `679593333241` | no |
| app_name |  | string | `Jenkins` | no |
| append_script |  | string | `` | no |
| asg_capacity_timeout |  | string | `10m` | no |
| asg_check_type |  | string | `ELB` | no |
| asg_desired |  | string | `1` | no |
| asg_grace_period |  | string | `300` | no |
| asg_max | The number of servers to deploy. For now this is one but we could change this to assist in scaling in future versions. | string | `1` | no |
| asg_min | The number of servers to deploy. For now this is one but we could change this to assist in scaling in future versions. | string | `1` | no |
| cidrs_ingress_elb | CIDR range for ingress to the LB. Default is world (0.0.0.0/0) | string | `<list>` | no |
| costcenter | Cost center for tagging | string | `` | no |
| environment | (optional) Platform environment (e.g. dev/stg/prod; default is dev) | string | `dev` | no |
| instance_type |  | string | `m4.large` | no |
| key_name | EC2 keypair name for instances | string | - | yes |
| lb_healthcheck_interval |  | string | `30` | no |
| lb_healthcheck_response_http |  | string | `301` | no |
| lb_healthcheck_response_https |  | string | `200` | no |
| lb_healthcheck_target |  | string | `/login` | no |
| lb_healthcheck_timeout |  | string | `5` | no |
| lb_healthy_threshold |  | string | `3` | no |
| lb_instance_port_http |  | string | `80` | no |
| lb_instance_port_https |  | string | `443` | no |
| lb_internal |  | string | `false` | no |
| lb_unhealthy_threshold |  | string | `3` | no |
| ports_ingress_elb |  | string | `<list>` | no |
| ports_ingress_instance |  | string | `<list>` | no |
| r53_zone_name | Route53 zone to use for DNS | string | `` | no |
| sg_additional | Additional security group to apply to instances (e.g. for Bastion SSH access) | string | `` | no |
| ssl_cert | (optional) SSL certificate for HTTPS from LB to ASG (default is terraform-generated) | string | `` | no |
| ssl_key | (optional) SSL key for HTTPS from LB to ASG (default is terraform-generated) | string | `` | no |
| ssl_policy |  | string | `ELBSecurityPolicy-2016-08` | no |
| subdomain | (optional) The name of the new subdomain to create. If not provided, defaults to '<env>-jenkins' | string | `` | no |
| subnets_elb | Subnets (probably public) for the load balancer | list | - | yes |
| subnets_instances | Subnets (probably private) for EC2 instances | list | - | yes |
| tenancy | (optional) EC2 instance tenancy (default or dedicated) | string | `default` | no |
| termination_policies_list |  | string | `<list>` | no |
| vpc_id | The VPC to deploy Jenkins | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| efs_id | Filesystem ID for EFS |
| elb_dns | DNS of the ELB itself |
| route53_dns | Route 53 fully-qualified domain name for the ELB |
| sg_efs | Security group for EFS |
