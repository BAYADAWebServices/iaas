terraform {
  backend "s3" {
    encrypt = true
    key     = "global/sharedservices/jenkins/state.tf"
  }
}
