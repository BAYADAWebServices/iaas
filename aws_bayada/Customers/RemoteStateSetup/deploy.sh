#!/bin/bash
# 
#There is one account per test customer, but one workspace per deployed test environment VPC.



if [ "$#" -lt 3 ]
then
  echo "Usage: ./deploy {terraform_function} {profile} {account} from directory of tf code"
  exit 1
fi

FUNCTION=$1
PROFILE=$2
ACCOUNT=$3

rm -rf ./.terraform ./terraform.tfstate.d ./terraform.tfstate*
terraform init
terraform $FUNCTION -var "profile=$PROFILE" -var "account=$ACCOUNT"

echo "cleaning up temp files that terraform created"


