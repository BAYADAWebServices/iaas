# Resources
Creates Shared VPC

# Version
0.0.1: Initial

# Usage
terraform init --backend-config=backend-us-east-1-shared_services.tfvars --backend-config "profile=shared_services_profile"
terraform apply -var "shared_transit_route_table=tableID" -var "transit_gateway_id=gatewayID" -var "profile=shared_services_profile"

