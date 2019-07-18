provider "aws" {
  profile = "${var.customer_account_profile}"
  region  = "${var.region}"
  alias	  = "${var.account_name}"

}

provider "aws" {
  profile = "${var.shared_services_profile}"
  region  = "${var.region}"
  alias	  = "${var.shared_alias}"

}