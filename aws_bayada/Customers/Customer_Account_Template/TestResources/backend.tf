terraform {
  backend "s3" {
    encrypt = true
    key     = "customers/"${var.customer_name}"/testresources/state.tf"
  }
}
