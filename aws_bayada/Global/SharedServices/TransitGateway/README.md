# Resources
Create Transit Gateway

# Version
0.0.1: Initial

# Usage
terraform init --backend-config=backend-us-east-1-shared_services.tfvars --backend-config "profile=shared_services_profile"

terraform apply -var "profile=shared_services_profile"

