# Resources
Creates test resources for test environment including instances, security groups, etc...

# Version
0.0.1: Initial

# Usage
# Usage
This is the template:
./deploy.sh {terraform_function} {env} {profile} {account}

Example: This assumes the environment will be for user1 and the aws profile is customer_name and the account is called customer_name.
./deploy apply user1 customer_name customer_name
