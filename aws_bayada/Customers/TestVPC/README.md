# Resources
Create test envionment VPC in a customer account utilizing a workspace for each environment.

# Version
0.0.1: Initial

# Usage
This is the template:
./deploy.sh {terraform_function} {vpcsubnet} {env} {accountprofile} {sharedprofile} {account} {bucket} 

Example: This assumes the environment will be for user1 and the account/customer is starbucks.

./deploy apply 10.20.10.0/24 user1 account_profile shared_services_profile starbucks starbucks.terraform.us-east-1

