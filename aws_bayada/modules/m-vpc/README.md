# aws-vpc module

This repo contains a [Terraform module](https://www.terraform.io/docs/modules/usage.html) to deploy an aws' vpc with options common to most applications. Additonally, the [variables.tf](variables.tf) file exposes a number of options which someone using this module can alter many default settings to match requirements of a given project.

### Version Requirements

Check the current [version.tf](version.tf) file to determine what version of Terraform the module was built around. To up or downgrade your version, obtain old and new versions at the [releases page](https://releases.hashicorp.com/terraform/) or the [Docker registry](https://hub.docker.com/r/hashicorp/terraform/tags/) for those deploying through a container -- which is an excellent way to use Terraform.

## How to use this module

At a basic level, you can deploy a fully functional vpc with three subnet layers (public, private, and isolated) across three availability zones in the `10.0.0.0/16` ip block by doing the following:

```
module "vpc" {
 source = "git::ssh://git-codecommit.us-east-1.amazonaws.com/v1/repos/m-vpc"
}
```

However, that's not super interesting, let's change some of the default settings and reference a specific version of the module to use:

```
module "vpc-alpha" {
  source = "git::ssh://git-codecommit.us-east-1.amazonaws.com/v1/repos/m-vpc?ref=v0.1.5"
  cidr_block  = "172.5.0.0/16"
  name        = "production vpc"
  environment = "prod"
  subnet_map {
     public   = "3"
     private  = "9"
     isolated = "0"
  }
}
```

In the above version we changed some tags, the CIDR block, and we increased the number of subnets in the private layer to nine while removing all isolated ones.

This module has many variables that can be changed and there will be many more in the future. See the variables.tf file linked above for all parts currently exposed by this module.

### Outputs!

This layer module has a few opinions outside of basic network structure. One thing it does provide however is a number of [outputs](outputs.tf), a few of which will be useful to all engineers. Aside from three lists of subnets (each corresponding to it's layer) the vpc's default security group and an `sg_allhosts` security group are exported. In practice, it's likely you will find this most useful if you apply it to *everything* possible in your vpc and then associate it with networking rules to allow incomming connections from your monitoring and bastioning security groups.

Make sure to check the above linked outputs file over time as version changes are most likely going to make new resources made available through that file.

### A note on networking.

By default this module will generate 9 subnets split among 3 networking layers spread across up to 3 availability zones. It is set up to handle changes to this networking model, allowing the user to specify between 0 and 9 subnets in each layer without having to mess with renumbering the subnetting of each layer. This is accomplished by assigning each subnet a `/21` with 2045 address in. In conjunction with that subnet sizing, the layers are assigned as follows:

`Public 10.0.x.x/21`

|      az-a |      az-b |      az-c |
|----------:|----------:|----------:|
|       0.0 |       8.0 |      16.0 |
|      24.0 |      32.0 |      40.0 |
|      48.0 |      56.0 |      64.0 |

`Private 10.0.x.x/21`

|      az-a |      az-b |      az-c |
|----------:|----------:|----------:|
|      72.0 |      80.0 |      88.0 |
|      96.0 |     104.0 |     112.0 |
|     120.0 |     128.0 |     136.0 |

`Isolated 10.0.x.x/21`

|      az-a |      az-b |      az-c |
|----------:|----------:|----------:|
|     144.0 |     152.0 |     160.0 |
|     168.0 |     176.0 |     184.0 |
|     192.0 |     200.0 |     208.0 |

Whether three, nine, or no subnets are deployed for each layer, the network will retain the above basic structure unless a cidr block outside of the `/16` is used or the `newbits` variable is changed. That is to say for example, the first subnet in the isolated layer will always be `x.x.144.0/21`; the eigth assigned subnet in the same layer will always be `x.x.200.0/21`.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| adminip |  | string | `172.0.0.1` | no |
| az_width |  | string | `3` | no |
| cidr_block |  | string | `10.0.0.0/16` | no |
| instance_tenancy |  | string | `default` | no |
| nat_instances |  | string | `3` | no |
| netnum_shift_map | This var controls the shift in subnet creation between the three basic subnet-types. | map | `<map>` | no |
| newbits | This controls subnet size. Default is 5, which against a /16 give a subnet size of /21 with 2045 addresses. | map | `<map>` | no |
| owner |  | string | `devops@foghornconsulting.com` | no |
| subnet_map |  | map | `<map>` | no |
| subnet_name_suffix |  | string | `<list>` | no |
| tag_application |  | string | `` | no |
| tag_costcenter |  | string | `` | no |
| tag_customer |  | string | `` | no |
| tag_environment |  | string | `` | no |
| tag_name |  | string | `FogOps` | no |
| enable_flow_logs | Whether VPC flow logs should be sent to S3. | boolean | false | no |
| flow_log_bucket| Bucket to send VPC flow logs to. Required if enable_flow_logs is true. | string | `` | no |
| flow_log_bucket_exists | If set to false, will create a S3 bucket for flow logs. | boolean | false | no |

## Outputs

| Name | Description |
|------|-------------|
| cidr_block |  |
| default_nacl |  |
| id |  |
| routes_isolated |  |
| routes_private |  |
| routes_public |  |
| sg_allhosts |  |
| sg_default |  |
| subnets_isolated |  |
| subnets_private |  |
| subnets_public |  |
