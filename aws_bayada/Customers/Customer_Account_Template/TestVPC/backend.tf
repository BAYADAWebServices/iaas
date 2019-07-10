terraform {
  backend "s3" {
    encrypt = true
    key     = "customers/custname/testvpc/state.tf"
  }
}
