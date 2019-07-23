# Resources
Create test envionment in a customer account utilizing a workspace for each environment.  This includes a dedicated VPC and AMIs for the various test envionment roles.

# Version
0.0.1: Initial

# Usage
This is the template:
./deploy.sh {terraform_function} {region} {vpcsubnet} {env} {accountrole} {accountname} {accountid} {vpcowner}

Example: This assumes the environment will be for Jeff and the account/customer is starbucks.

./deploy.sh plan us-east-1 10.20.12.0/24 starbucks-Jeff BWS-SQAOrgTest-FullAdmin bws-sqa-org-test 123403453763 Jeff

