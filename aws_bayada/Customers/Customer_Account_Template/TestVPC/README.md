# Resources
Create test envionment VPC in a customer account utilizing a workspace for each environment.

# Version
0.0.1: Initial

# Usage
This is the template:
./deploy.sh {terraform_function} {vpcsubnet} {env} {profile} {account}

Example: This assumes the environment will be for user1 and the aws profile is customer_name and the account is called customer_name.
./deploy apply 10.20.10.0/24 user1 customer_name customer_name
