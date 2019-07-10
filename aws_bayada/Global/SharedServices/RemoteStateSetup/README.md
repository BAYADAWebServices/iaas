# Resources
* Builds S3 bucket in new account
* Dynamo table in new account

# Version
0.0.1: Initial

# Usage

terraform init

terraform apply -var-file="SharedServices.tfvars"
where customer_name.tfvars defines the variables

Example of vars file

region = "us-east-1"
profile = "shared_services_profile"
account_name = "shared-services"

