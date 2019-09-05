#!/bin/bash
# 
# Function: plan or apply
#
# VPCsubnet: Subnet for the VPC
#
# Environment: Each customer alias will have its own workspaces.  An alias should be chosen for each customer and used to deploy resources
# to that customer for each test user in the following format: customer-vpcowner
#
# Account Role: The AWS profile used to provide authentication to the customer account.  It should refer to the assumed role.
# 
# Account Name: Name for customer test account.
# 
# AccountID: Account ID of customer account
#
# vpcowner: The test user who will utilize the vpc.


if [ "$#" -lt 9 ]
then
  echo "Usage: ./deploy.sh {terraform_function} {region} {vpcsubnet} {user_env} {accesskey} {secretkey} {customerrole} {accountname} {keypair} from directory of tf code"
  exit 1
fi

FUNCTION=$1
REGION=$2
VPCSUBNET=$3
user_env=$4
ACCESSKEY=$5
SECRETKEY=$6
CUSTOMERROLE=$7
ACCOUNTNAME=$8
KEYPAIR=$9


rm -rf ./.terraform ./terraform.tfstate.d ./terraform.tfstate*
terraform init --backend-config=backend-us-east-1-testenv.tfvars
terraform workspace new $user_env
terraform workspace select $user_env
terraform $FUNCTION -auto-approve -var "region=$REGION" -var "vpc_subnet=$VPCSUBNET" -var "user_env=$user_env" -var "access_key=$ACCESSKEY" -var "secret_key=$SECRETKEY" -var "customer_role=$CUSTOMERROLE" -var "account_name=$ACCOUNTNAME" -var "key_pair=$KEYPAIR"

echo "cleaning up temp files that terraform created"

#Sample:  ./deploy.sh plan us-east-1 10.20.12.0/24 SQA-Jeff accesskey secrectkey CustomerRole  bws-sqa-org-test sqatest