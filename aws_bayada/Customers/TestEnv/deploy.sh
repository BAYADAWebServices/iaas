#!/bin/bash
# 
# Function: plan or apply
#
# VPCsubnet: Subnet for the VPC
#
# Environment: Each customer alias will have its own workspace.  An alias should be chosen for each customer ans used to deploy resources
# to that customer in their own terrafrom workspace. 
#
# Account Role: The AWS profile used to provide authentication to the customer account.  It should refer to the assumed role.
# 
# Shared Role: The AWS profile use to provide authentication to the shared services account.  It should refer to the assumed role.
# 
# Account Name: Name for customer test account.
# 
# AccountID: Account ID of customer account


if [ "$#" -lt 7 ]
then
  echo "Usage: ./deploy.sh {terraform_function} {region} {vpcsubnet} {env} {accountrole} {accountname} {accountid} {vpcowner} from directory of tf code"
  exit 1
fi

FUNCTION=$1
REGION=$2
VPCSUBNET=$3
ENVIRONMENT=$4
ACCOUNTROLE=$5
ACCOUNTNAME=$6
ACCOUNTID=$7
VPCOWNER=$8


rm -rf ./.terraform ./terraform.tfstate.d ./terraform.tfstate*
terraform init --backend-config=backend-us-east-1-testenv.tfvars
terraform workspace new $ENVIRONMENT
terraform workspace select $ENVIRONMENT
terraform $FUNCTION -var "region=$REGION" -var "vpcsubnet=$VPCSUBNET" -var "environment=$ENVIRONMENT" -var "customer_account_profile=$ACCOUNTROLE" -var "account_name=$ACCOUNTNAME" -var "account_id=$ACCOUNTID" -var "vpc_owner=$VPCOWNER"

echo "cleaning up temp files that terraform created"

#Sample:  ./deploy.sh plan 10.20.11.0/24 user2 BWS-SQAOrgTest-FullAdmin BWS-OPSSharedServiceDev-FullAdmin bws-sqa-org-test 123403453763 bws-sqa-org-test-terraform-us-east-1