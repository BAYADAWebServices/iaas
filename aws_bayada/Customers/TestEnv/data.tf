data "aws_ami" "rdp1" {
  provider    = "aws.customer_account"
  most_recent = true
  owners      = ["amazon"]  

  filter {
    name   = "name"
    values = ["Windows_Server-2012-R2_RTM-English-64Bit-Base-*"]
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

data "aws_ami" "db-default" {
  provider    = "aws.ses_shared_srvc_dev"
  most_recent = true
  owners      = ["764320393679"]  

  filter {
    name   = "name"
    values = ["bws-Windows2012R2-SQLServer2012-Developer-Default-*"]
  }

}

data "aws_ami" "db-gp" {
  provider    = "aws.ses_shared_srvc_dev"
  most_recent = true
  owners      = ["764320393679"]  

  filter {
    name   = "name"
    values = ["bws-Windows2012R2-SQLServer2012-Developer-GP-*"]
  }

}

/*
data "template_file" "web1-userdata" {
   template = <<EOF
		<powershell>
			Rename-Computer -NewName "WEB1" -restart -force
		</powershell>
	EOF

}
*/
