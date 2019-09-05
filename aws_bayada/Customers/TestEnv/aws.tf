provider "aws" {
  access_key 	= "${var.access_key}"
  secret_key 	= "${var.secret_key}"
  region  		= "${var.region}"
  alias	  		= "customer_account"

  assume_role {
  	role_arn	= "${var.customer_role}"
  }
}


provider "aws" {
  access_key 	= "${var.access_key}"
  secret_key 	= "${var.secret_key}"
  region  		= "${var.region}"
  alias	  		= "shared_services"

  assume_role {
  	role_arn	= "${var.shared_role}"
  }
}


