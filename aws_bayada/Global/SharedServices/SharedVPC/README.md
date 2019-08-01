# Resources
Creates Shared VPC

# Version
0.0.1: Initial

# Usage
terraform init --backend-config="backend-OpsSharedServices.tfvars" --backend-config "profile=BWS-OPSSharedServiceDev-FullAdmin"

terraform apply  -var "profile=BWS-OPSSharedServiceDev-FullAdmin"

#profile for shared service vpc. e.g. BWS-OPSSharedServiceDev-FullAdmin
