terraform {
  backend "s3" {
    encrypt = true
    key     = "global/sharedservices/transitgateway/state.tf"
  }
}
