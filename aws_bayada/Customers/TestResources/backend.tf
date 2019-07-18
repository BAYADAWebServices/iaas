terraform {
  backend "s3" {
    encrypt = true
    key     = "testresources/state.tf"
  }
}
