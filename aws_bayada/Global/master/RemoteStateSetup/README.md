# Resources
* Builds S3 buckets
* Dynamo table

# Version
0.0.1: Initial

# Usage

terraform init

terraform apply -var-file="master_acct_name.tfvars"
where account.tfvars defines the variables

Example of vars file

region = "us-east-1"
profile = "MasterProfileName"
account_name = "MasterAcctName"

