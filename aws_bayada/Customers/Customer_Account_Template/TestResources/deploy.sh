#!/bin/bash
# 
#There is one account per test customer, but one workspace per deployed test environment VPC.

# The env variable should refer to the owner/user of the test environment to create their terraform workspace.
# The profile is the aws profile used to provide authentication keys.
# The account variable should be the customer name assuming it is named for the customer.
#

if [ "$#" -lt 5 ]
then
  echo "Usage: ./deploy {terraform_function} {env} {profile} {account} from directory of tf code"
  exit 1
fi

FUNCTION=$1
ENVIRONMENT=$2
PROFILE=$3
ACCOUNT=$4

rm -rf ./.terraform ./terraform.tfstate.d ./terraform.tfstate*
terraform init --backend-config=backend-us-east-1-${ACCOUNT}.tfvars --backend-config "profile=$PROFILE"
terraform workspace new $ENVIRONMENT
terraform workspace select $ENVIRONMENT
terraform $FUNCTION -var "environment=$ENVIRONMENT" -var "profile=$PROFILE"

echo "cleaning up temp files that terraform created"