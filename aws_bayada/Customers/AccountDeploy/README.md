# Resources
Creates customer account from master account.

# Version
0.0.1: Initial

# Usage
terraform init --backend-config=backend-MasterAccount.tfvars --backend-config "profile=bayada"
terraform apply -var "profile=MasterAcctProfile" -var "account_email=email" -var "account_name=CustomerName" -var "account_admin_role=RoleName"

