# Resources
* This terraform module creates the backend process to control locking so only one person can make changes at once.  

# Resources
* Builds S3 bucket in new account (stores tf lock file)
* Dynamo table in new account (specifies the lcok file and id associated with that lock)

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

