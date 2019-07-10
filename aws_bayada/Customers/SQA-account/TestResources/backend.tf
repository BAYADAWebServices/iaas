terraform {
  backend "s3" {
    encrypt = true
    key     = "customers/SQA/testresources/state.tf"
  }
}
