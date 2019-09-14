provider "aws" {
  profile = "${var.shared_r53_profile}"
  region  = "${var.region}"
  alias	  = "route53_account"

}

provider "aws" {
  profile = "${var.shared_services_profile}"
  region  = "${var.region}"
  #alias	  = "shared_services"

}