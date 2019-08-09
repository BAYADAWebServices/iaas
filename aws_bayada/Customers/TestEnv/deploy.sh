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
  echo "Usage: ./deploy.sh {terraform_function} {region} {vpcsubnet} {terraform-env} {accountrole} {accountname} {accountid} {vpcowner} {customer} {environment} {bayada app} from directory of tf code"
  exit 1
fi

FUNCTION=$1
REGION=$2
VPCSUBNET=$3
TERRAFORMENV=$4
ACCOUNTROLE=$5
ACCOUNTNAME=$6
ACCOUNTID=$7
VPCOWNER=$8
CUSTOMER=$9
ENVIRONMENT=$10
BAYAPP=$11

rm -rf ./.terraform ./terraform.tfstate.d ./terraform.tfstate*
terraform init --backend-config=backend-us-east-1-testenv.tfvars
terraform workspace new $TERRAFORMENV
terraform workspace select $TERRAFORMENV
terraform $FUNCTION -var "bayapp=$BAYAPP" -var "region=$REGION" -var "vpcsubnet=$VPCSUBNET" -var "terraformenv=$TERRAFORMENV" -var "customer_account_profile=$ACCOUNTROLE" -var "account_name=$ACCOUNTNAME" -var "account_id=$ACCOUNTID" -var "vpc_owner=$VPCOWNER" -var "customer_name=$CUSTOMER" -var "environment=$ENVIRONMENT"

echo "cleaning up temp files that terraform created"

#Sample:  ./deploy.sh plan us-east-1 10.20.30.0/24 SQA-bmarino BWS-SQAOrgTest-FullAdmin SqaOrgTest 123403453763 bmarino SQA TEST
