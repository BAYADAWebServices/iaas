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


if [ "$#" -lt 11 ]
then
  echo "Usage: ./deploy.sh {terraform_function} {Account Name} {Email Address} {Admin Role Name}"

  exit 1
fi

FUNCTION=$1
ACCOUNTNAME=$2
EMAIL=$3
ROLENAME=$4

rm -rf ./.terraform ./terraform.tfstate.d ./terraform.tfstate*

terraform init --backend-config=backend-MasterAccount.tfvars --backend-config "profile=bayada"

terraform $FUNCTION -var "profile=bayada" -var "account_email=$EMAIL" -var "account_name=$ACCOUNTNAME" -var "account_admin_role=$ROLENAME"

echo "cleaning up temp files that terraform created"

#Sample:  ./deploy.sh apply OPS-SharedServices-NonProd bws-ops-sharedservices-nonprod@bayada.com BWS-OPSSharedServicesNonProd-FullAdmin
