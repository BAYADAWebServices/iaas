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
  echo "Usage: ./deploy.sh {terraform_function} {region} {vpcsubnet} {userenv} {accesskey} {secretkey} {customerrole} {accountname} {accountid} from directory of tf code"
  exit 1
fi

FUNCTION=$1
REGION=$2
VPCSUBNET=$3
USERENV=$4
ACCESSKEY=$5
SECRETKEY=$6
CUSTOMERROLE=$7
ACCOUNTNAME=$8
ACCOUNTID=$9



rm -rf ./.terraform ./terraform.tfstate.d ./terraform.tfstate*
terraform init --backend-config=backend-us-east-1-testenv.tfvars
terraform workspace new $user_env
terraform workspace select $user_env
terraform $FUNCTION -auto-approve -var "region=$REGION" -var "vpc_subnet=$VPCSUBNET" -var "user_env=$USERENV" -var "access_key=$ACCESSKEY" -var "secret_key=$SECRETKEY" -var "customer_role=$CUSTOMERROLE" -var "account_name=$ACCOUNTNAME" -var "account_id=$ACCOUNTID" 

echo "cleaning up temp files that terraform created"

