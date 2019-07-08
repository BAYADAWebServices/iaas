terraform {
  backend "s3" {
    encrypt = true
    key     = "global/sharedservices/sharedvpc/state.tf"
  }
}
