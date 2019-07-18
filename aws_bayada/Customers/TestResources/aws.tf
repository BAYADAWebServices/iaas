provider "aws" {
  profile = "${var.customer_account_profile}"
  region  = "${var.region}"
}


