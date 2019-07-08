# Resources
Creates Jenkins Server

# Version
0.0.1: Initial

# Usage
terraform init --backend-config=backend-us-east-1-shared_account_name.tfvars --backend-config "profile=shared_account_profile"
terraform apply -var "region=us-east-1" -var "profile=shared_account_profile"

