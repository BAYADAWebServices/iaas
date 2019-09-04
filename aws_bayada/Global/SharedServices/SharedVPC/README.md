# Resources
Creates Shared VPC

# Version
0.0.1: Initial

# Usage
terraform init --backend-config="backend-OpsSharedServices.tfvars" --backend-config "profile=BWS-OPSSharedServiceDev-FullAdmin"

terraform apply 

#profile for shared service vpc. e.g. BWS-OPSSharedServiceDev-FullAdmin and Route53 hosted account profile must be specified in vars or called here.


