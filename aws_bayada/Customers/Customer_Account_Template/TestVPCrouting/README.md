# Resources
Create test envionment VPC in a customer account utilizing a workspace for each environment.

# Version
0.0.1: Initial

# Usage
This is the template:
./deploy.sh {terraform_function} {env} {profile} {account} {custgwattachid} 

Example: This assumes the environment will be for user1 and the aws profile is customer_name and the account is called customer_name.

./deploy apply user1 shared_services_profile shared-services custGWattachID
