terraform {
  backend "s3" {
    encrypt = true
    key     = "customers/sharedservices/SQA/state.tf"
  }
}
