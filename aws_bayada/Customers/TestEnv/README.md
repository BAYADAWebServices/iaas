# Resources
Create test envionment in a customer account utilizing a workspace for each environment.  This includes a dedicated VPC and AMIs for the various test envionment roles.

# Version
0.0.1: Initial

# Usage
This is the template:
./deploy.sh {terraform_function} {region} {keypair} {vpcsubnet} {userenv} {accesskey} {secretkey} {customerrole} {accountid} {accountname}

Example: 
./deploy.sh plan us-east-1 testpair 10.20.12.0/24 Jeff accesskey secrectkey CustomerRole accoundIDnumber bws-sqa-org-test





