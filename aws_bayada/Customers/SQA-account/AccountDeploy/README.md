# Resources
Creates customer account from master account.

# Version
0.0.1: Initial

# Usage
terraform init --backend-config=backend-us-east-1-MasterAccount.tfvars --backend-config "profile=MasterAcctProfile"

terraform apply -var "profile=MasterAcctProfile" -var "account_email=email" -var "customer_name=CustomerName" -var "ou_parent_id=ORG_OUparentID"

