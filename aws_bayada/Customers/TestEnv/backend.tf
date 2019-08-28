terraform {
  backend "s3" {
    encrypt = true
    key     = "testenv/state.tf"
  }
}
