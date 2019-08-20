data "aws_ami" "rdp1" {
  provider    = "aws.ses_shared_srvc_dev"
  most_recent = true
  owners      = ["764320393679"]   

  filter {
    name   = "name"
    values = ["bws-Windows2012R2-RDP-*"]
  }

}

data "aws_ami" "web" {
  provider    = "aws.ses_shared_srvc_dev"
  most_recent = true
  owners      = ["764320393679"]  

  filter {
    name   = "name"
    values = ["bws-Windows2012R2-WebServer-*"]
  }

}

data "aws_ami" "dc" {
  provider    = "aws.ses_shared_srvc_dev"
  most_recent = true
  owners      = ["764320393679"]  

  filter {
    name   = "name"
    values = ["bws-Windows2016-AD-DNS-*"]
  }

}

data "aws_ami" "db_default" {
  provider    = "aws.ses_shared_srvc_dev"
  most_recent = true
  owners      = ["764320393679"]  

  filter {
    name   = "name"
    values = ["bws-Windows2012R2-SQLServer2012-Developer-Default-*"]
  }

}

data "aws_ami" "db_gp" {
  provider    = "aws.ses_shared_srvc_dev"
  most_recent = true
  owners      = ["764320393679"]  

  filter {
    name   = "name"
    values = ["bws-Windows2012R2-SQLServer2012-Developer-GP-*"]
  }

}
