terraform {
  backend "s3" {
    encrypt = true
    key     = "customers/custname/AccountDeploy/state.tf"
  }
}
