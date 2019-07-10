# Resources
Creates AWS Organization
Creates OUs

# Version
0.0.1: Initial

# Usage
terraform init --backend-config=backend-us-east-1-MasterAcct.tfvars --backend-config "profile=MasterAcctProfile"

terraform apply -var "profile=MasterAcctProfile"
