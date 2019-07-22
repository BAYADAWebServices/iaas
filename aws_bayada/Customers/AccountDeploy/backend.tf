terraform {
  backend "s3" {
    encrypt = true
    key     = "customers/AccountDeploy/state.tf"
  }
}
