#!/bin/bash
# 
# Function: plan or apply
#
# Environment: There is one account per test customer, but one workspace per deployed test environment VPC.
# The env variable should refer to the owner/user of the test environment to create their terraform workspace.
#
# Cust profile: The AWS profile used to provide authentication to the customer account
# 
# Bucket: The S3 bucket for the terraform state file.
# The file is in this format in the customer account: "accountname-terraform-region"  EG: "starbucks-terraform-us-east-1"



if [ "$#" -lt 5 ]
then
  echo "Usage: ./deploy.sh {terraform_function} {env} {accountprofile} {account} {bucket} from directory of tf code"
  exit 1
fi

FUNCTION=$1
ENVIRONMENT=$2
ACCOUNTPROFILE=$3
ACCOUNT=$4
BUCKET=$5

rm -rf ./.terraform ./terraform.tfstate.d ./terraform.tfstate*
terraform init --backend-config=backend-us-east-1-customer.tfvars --backend-config="customer_profile=$ACCOUNTPROFILE" --backend-config="S3bucket=$BUCKET"
terraform workspace new $ENVIRONMENT
terraform workspace select $ENVIRONMENT
terraform $FUNCTION -var "environment=$ENVIRONMENT" -var "customer_account_profile=$ACCOUNTPROFILE" -var "account_name=$ACCOUNT"

echo "cleaning up temp files that terraform created"

