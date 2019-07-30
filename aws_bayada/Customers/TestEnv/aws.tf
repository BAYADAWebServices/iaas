provider "aws" {
  profile = "${var.customer_account_profile}"
  region  = "${var.region}"
  alias	  = "customer_account"

}

provider "aws" {
  profile = "${var.ops_shared_srvc_dev_profile}"
  region  = "${var.region}"
  alias	  = "ops_shared_srvc_dev"

}

provider "aws" {
  profile = "${var.ses_shared_srvc_dev_profile}"
  region  = "${var.region}"
  alias	  = "ses_shared_srvc_dev"

}

