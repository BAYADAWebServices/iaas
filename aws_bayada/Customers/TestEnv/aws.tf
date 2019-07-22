provider "aws" {
  profile = "${var.customer_account_profile}"
  region  = "${var.region}"
  alias	  = "customer_account"

}

provider "aws" {
  profile = "${var.shared_services_profile}"
  region  = "${var.region}"
  alias	  = "shared_services"

}

