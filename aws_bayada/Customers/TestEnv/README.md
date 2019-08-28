# Resources
* Create test envionment for a Tester by utilizing a workspace for each environment.  This includes a dedicated VPC and AMIs for the various test envionment roles.

# Version
* 0.0.2: Initial

# Usage
Syntax:
./deploy.sh {terraform_function} {region} {vpcsubnet} {terraform-env} {accountrole} {accountname} {accountid} {vpcowner} {customer} {environment}

Example: This assumes the environment will be for Brian and the customer is sqa office.

*You will need to know the subnet, role name, account id

* Build a plan that will get executed
./deploy.sh plan us-east-1 10.20.30.0/24 SQA-bmarino BWS-SQAOrgTest-FullAdmin SqaOrgTest 123403453763 bmarino SQA TEST org 10.20.0.89

* Create Objects
./deploy.sh apply us-east-1 10.20.30.0/24 SQA-bmarino BWS-SQAOrgTest-FullAdmin SqaOrgTest 123403453763 bmarino SQA TEST org 10.20.0.89

* Delete Objects
./deploy.sh destroy us-east-1 10.20.30.0/24 SQA-bmarino BWS-SQAOrgTest-FullAdmin SqaOrgTest 123403453763 bmarino SQA TEST org 10.20.0.89
