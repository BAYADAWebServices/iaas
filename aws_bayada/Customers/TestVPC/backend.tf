terraform {
  backend "s3" {
    encrypt = true
    key     = "testvpc/state.tf"
  }
}
