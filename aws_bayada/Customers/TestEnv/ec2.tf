resource "aws_instance" "web1" {
  provider                    = "aws.customer_account"
  #ami                         = "${var.ami_web1}"
  ami                         = "${data.aws_ami.web.id}"
  instance_type               = "${var.web1_instance_size}"
  subnet_id                   = "${module.vpc.subnets_isolated[0]}"
  vpc_security_group_ids      = ["${aws_security_group.web1.id}"]
  iam_instance_profile        = "${aws_iam_instance_profile.S3_profile.name}"
  key_name                    = "${var.key_name}"
  tenancy                     = "default"
  associate_public_ip_address = "false"
  
  user_data				  = "${data.template_file.web1-init.rendered}"
  #depends_on = ["aws_ami_launch_permission.share_web_ami"]
  
/*
 
  provisioner "remote-exec" {
	connection {
      type     = "winrm"
      user     = "Administrator"
      password = "${var.admin_password}"
    }
    inline = [
      "powershell -Command \"&{Rename-Computer -NewName ${var.web1_name} -Restart}\"",
	  "powershell -File \"C:\\windows\\temp\\download.ps1\"",
    ]
  }
*/
  
  tags {
    Name                = "iWeb1-${var.account_name}-${var.vpc_owner}"
	"bws:Environment"   = "${var.environment}"
    "bws:Service"       = "${var.ses_service}"
    "bws:Software"      = "IIS"
    "bws:Customer"      = "${var.customer_name}"
    "bws:Description"   = "Web server that hosts custom web applicaiton"
	"bws:InstanceScheduler" = "${var.instance_scheduler}"

  }
}

/*
resource "aws_instance" "web2" {
  provider                    = "aws.customer_account"
  #ami                         = "${var.ami_web2}"
  ami                         = "${data.aws_ami.web.id}"   
  instance_type               = "${var.web2_instance_size}"
  subnet_id                   = "${module.vpc.subnets_isolated[0]}"
  vpc_security_group_ids      = ["${aws_security_group.web2.id}"]
  iam_instance_profile        = "${aws_iam_instance_profile.S3_profile.name}"
  key_name                    = "${var.key_name}"
  tenancy                     = "default"
  associate_public_ip_address = "false"
  # depends_on = ["aws_ami_launch_permission.share_web_ami"]

  tags {
    Name                = "iWeb2-${var.account_name}-${var.vpc_owner}"
	"bws:Environment"   = "${var.environment}"
    "bws:Service"       = "${var.ses_service}"
    "bws:Software"      = "IIS"
    "bws:Customer"      = "${var.customer_name}"
    "bws:Description"   = "Web server that hosts custom web applicaiton"
	"bws:InstanceScheduler" = "${var.instance_scheduler}"
	
  }
}

resource "aws_instance" "db1" {
  provider                    = "aws.customer_account"
  #ami                         = "${var.ami_db1}"
  ami                         = "${data.aws_ami.db-default.id}" 
  instance_type               = "${var.db1_instance_size}"
  subnet_id                   = "${module.vpc.subnets_isolated[0]}"
  vpc_security_group_ids      = ["${aws_security_group.db1.id}"]
  iam_instance_profile        = "${aws_iam_instance_profile.S3_profile.name}"  
  key_name                    = "${var.key_name}"
  tenancy                     = "default"
  associate_public_ip_address = "false"
  # depends_on = ["aws_ami_launch_permission.share_db1_ami"]

  tags {
    Name                = "iDB1-${var.account_name}-${var.vpc_owner}"
	"bws:Environment"   = "${var.environment}"
    "bws:Software"      = "SQLServer2012"
	"bws:SQLInstance"   = "GP"
	"bws:Service"       = "${var.ses_service}"
	"bws:Customer"      = "${var.customer_name}"
	"bws:Description"   = "SQL Server for hosting custom application database"
	"bws:InstanceScheduler" = "${var.instance_scheduler}"
		
  }
}

resource "aws_instance" "db2" {
  provider                    = "aws.customer_account"
  #ami                         = "${var.ami_db2}"
  ami                         = "${data.aws_ami.db-gp.id}"  
  instance_type               = "${var.db2_instance_size}"
  subnet_id                   = "${module.vpc.subnets_isolated[0]}"
  vpc_security_group_ids      = ["${aws_security_group.db2.id}"]
  iam_instance_profile        = "${aws_iam_instance_profile.S3_profile.name}"
  key_name                    = "${var.key_name}"
  tenancy                     = "default"
  associate_public_ip_address = "false"
 #  depends_on = ["aws_ami_launch_permission.share_db2_ami"]

  tags {
    Name                = "iDB2-${var.account_name}-${var.vpc_owner}"
	"bws:Environment"   = "${var.environment}"
	"bws:Service"       = "${var.ses_service}"
    "bws:Software"      = "SQLServer2012"
	"bws:SQLInstance"   = "Default"
    "bws:Customer"      = "${var.customer_name}"
    "bws:Description"   = "SQL Server for hosting custom application database"
	"bws:InstanceScheduler" = "${var.instance_scheduler}"
		
  }
}

resource "aws_instance" "dc1" {
  provider                    = "aws.customer_account"
  #ami                        = "${var.ami_dc1}"
  ami                         = "${data.aws_ami.dc.id}" 
  instance_type               = "${var.dc1_instance_size}"
  subnet_id                   = "${module.vpc.subnets_isolated[0]}"
  vpc_security_group_ids      = ["${aws_security_group.dc1.id}"]
  iam_instance_profile        = "${aws_iam_instance_profile.S3_profile.name}"
  key_name                    = "${var.key_name}"
  tenancy                     = "default"
  associate_public_ip_address = "false"
  # depends_on = ["aws_ami_launch_permission.share_dc1_ami"]


  tags {
    Name                = "iDC1-${var.account_name}-${var.vpc_owner}"
    "bws:Application"   = "ActiveDirectory"
	"bws:Environment"   = "${var.environment}"
    "bws:Service"       = "${var.ses_service}"
    "bws:Customer"      = "${var.customer_name}"
	"bws:Description"   = "Baseline Active Directory Service"
	"bws:InstanceScheduler" = "${var.instance_scheduler}"
		
  }
}

resource "aws_instance" "rdp1" {
  provider                    = "aws.customer_account"
  ami                         = "${data.aws_ami.rdp1.id}"
  instance_type               = "${var.rdp1_instance_size}"
  subnet_id                   = "${module.vpc.subnets_isolated[0]}"
  vpc_security_group_ids      = ["${aws_security_group.rdp1.id}"]
  iam_instance_profile        = "${aws_iam_instance_profile.S3_profile.name}"  
  key_name                    = "${var.key_name}"
  tenancy                     = "default"
  associate_public_ip_address = "false"
  # depends_on = ["aws_ami_launch_permission.share_rdp1_ami"]

  tags {
    Name                = "iRDP1-${var.account_name}-${var.vpc_owner}"
	"bws:Customer"      = "${var.customer_name}"
	"bws:Environment"   = "${var.environment}"
	"bws:Service"       = "${var.ses_service}"
	"bws:Description"   = "Desktop for testers to gain access to their environment to test their application of choice."
	"bws:InstanceScheduler" = "${var.instance_scheduler}"
	
  }
}
*/
