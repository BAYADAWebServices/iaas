#!/bin/bash
# 
#There is one account per test customer, but one workspace per deployed test environment VPC.



if [ "$#" -lt 2 ]
then
  echo "Usage: ./deploy {terraform_function} {profile} {account} from directory of tf code"
  exit 1
fi

FUNCTION=$1
PROFILE=$2

rm -rf ./.terraform ./terraform.tfstate.d ./terraform.tfstate*
terraform init
terraform $FUNCTION -var "profile=$PROFILE"

echo "cleaning up temp files that terraform created"


