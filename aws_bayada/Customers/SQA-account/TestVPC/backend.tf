terraform {
  backend "s3" {
    encrypt = true
    key     = "customers/SQA/testvpc/state.tf"
  }
}
