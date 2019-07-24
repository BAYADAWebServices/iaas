# Description
* aws resources to manage terraform locked files.
* This will avoid multiple users from modifying the same file at the same time.

# Resources
* Builds S3 bucket in new account
* Dynamo table in new account

# Version
0.0.1: Initial

# Usage

terraform init

terraform apply -var-file="OpsSharedServices.tfvars"
	# where OpsSharedServices.tfvars defines the variables
