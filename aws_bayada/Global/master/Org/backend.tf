terraform {
  backend "s3" {
    encrypt = true
    key     = "global/org/state.tf"
  }
}
