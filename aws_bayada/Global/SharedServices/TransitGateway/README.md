# Resources
Create Transit Gateway

# Version
0.0.1: Initial

# Usage
terraform init --backend-config="backend-OpsSharedServices" --backend-config "profile=ses_shared_dev_admin"

terraform apply -var "profile=ses_shared_dev_admin"

