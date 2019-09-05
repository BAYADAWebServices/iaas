# Resources
Create test envionment in a customer account utilizing a workspace for each environment.  This includes a dedicated VPC and AMIs for the various test envionment roles.

# Version
0.0.1: Initial

# Usage
This is the template:
./deploy.sh {terraform_function} {region} {vpcsubnet} {user_env} {accesskey} {secret_key} {customer_role} {accountname} {keypair}

Example: This assumes the environment will be for Jeff and the account/customer is starbucks.

./deploy.sh plan us-east-1 10.20.12.0/24 SQA-Jeff accesskey secrectkey CustomerRole  bws-sqa-org-test sqatest


./deploy.sh plan us-east-1 10.20.42.0/24 SQA-Mike AKIA6RC45HHQXLT4HXSN RTeEqw22gs3SJtYUDi+88SPzOgOcANrnj/LgHZ/u arn:aws:iam::123403453763:role/BWS-SQAOrgTest-FullAdmin bws-sqa-org-test sqatest

./deploy.sh plan us-east-1 10.20.12.0/24 SQA-Jeff accesskey secrectkey CustomerRole  bws-sqa-org-test sqatest