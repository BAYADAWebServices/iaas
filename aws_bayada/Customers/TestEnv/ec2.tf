resource "aws_instance" "web1" {
  provider                    = "aws.customer_account"
  ami                         = "${var.ami_web1}"
  instance_type               = "${var.web1_instance_size}"
  subnet_id                   = "${module.vpc.subnets_isolated[0]}"
  vpc_security_group_ids      = ["${aws_security_group.web1.id}"]
  iam_instance_profile        = "${aws_iam_instance_profile.S3_profile.name}"
  key_name                    = "${var.key_name}"
  tenancy                     = "default"
  associate_public_ip_address = "false"
  # depends_on = ["aws_ami_launch_permission.share_web_ami"]

  tags {
    Name              = "iWeb1-${var.account_name}-${var.vpc_owner}"
    "bws:Application"   = "OrganizationServices"
    "bws:Application"   = "SingleSignOn"
    "bws:Application"   = "FindAnOffice"
    "bws:Service"       = "Software Quality Assurance and Testing"
    "bws:Software"      = "IIS"
    "bws:Owner"         = "SQA"
    "bws:Description"   = "Web server that hosts the OrgServices web applicaiton"
  }
}

resource "aws_instance" "web2" {
  provider                    = "aws.customer_account"
  ami                         = "${var.ami_web2}"
  instance_type               = "${var.web2_instance_size}"
  subnet_id                   = "${module.vpc.subnets_isolated[0]}"
  vpc_security_group_ids      = ["${aws_security_group.web2.id}"]
  iam_instance_profile        = "${aws_iam_instance_profile.S3_profile.name}"
  key_name                    = "${var.key_name}"
  tenancy                     = "default"
  associate_public_ip_address = "false"
  # depends_on = ["aws_ami_launch_permission.share_web_ami"]

  tags {
    Name              = "iWeb2-${var.account_name}-${var.vpc_owner}"
    "bws:Application"   = "MasterData"
    "bws:Service"       = "Software Quality Assurance and Testing"
    "bws:Software"      = "IIS"
    "bws:Owner"         = "SQA"
    "bws:Description"   = "Web server that hosts the MasterData web applicaiton"
  }
}

resource "aws_instance" "db1" {
  provider                    = "aws.customer_account"
  ami                         = "${var.ami_db1}"
  instance_type               = "${var.db1_instance_size}"
  subnet_id                   = "${module.vpc.subnets_isolated[0]}"
  vpc_security_group_ids      = ["${aws_security_group.db1.id}"]
  iam_instance_profile        = "${aws_iam_instance_profile.S3_profile.name}"  
  key_name                    = "${var.key_name}"
  tenancy                     = "default"
  associate_public_ip_address = "false"
  # depends_on = ["aws_ami_launch_permission.share_db1_ami"]

  tags {
    Name              = "iDB1-${var.account_name}-${var.vpc_owner}"
    "bws:Application"   = "MasterData"
    "bws:Software"      = "SQLServer2012"
	"bws:Service"       = "Software Quality Assurance and Testing"
	"bws:Owner"         = "SQA"
	"bws:Description"   = "SQL Server for hosting MasterData database"
  }
}

resource "aws_instance" "db2" {
  provider                    = "aws.customer_account"
  ami                         = "${var.ami_db2}"
  instance_type               = "${var.db2_instance_size}"
  subnet_id                   = "${module.vpc.subnets_isolated[0]}"
  vpc_security_group_ids      = ["${aws_security_group.db2.id}"]
  iam_instance_profile        = "${aws_iam_instance_profile.S3_profile.name}"
  key_name                    = "${var.key_name}"
  tenancy                     = "default"
  associate_public_ip_address = "false"
 #  depends_on = ["aws_ami_launch_permission.share_db2_ami"]

  tags {
    Name              = "iDB2-${var.account_name}-${var.vpc_owner}"
    "bws:Application"   = "OrganizationServices"
    "bws:Application"   = "SingleSignOn"
    "bws:Application"   = "FindAnOffice"
	"bws:Service"       = "Software Quality Assurance and Testing"
    "bws:Software"      = "SQLServer2012"
    "bws:Owner"         = "SQA"
    "bws:Description"   = "SQL server that hosts the OrgServices database"
  }
}

resource "aws_instance" "dc1" {
  provider                    = "aws.customer_account"
  ami                         = "${var.ami_dc1}"
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
    "bws:Service"       = "Software Quality Assurance and Testing"
    "bws:Owner"         = "SQA"
	"bws:Description"   = "Baseline Directory Service"
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
    Name            = "iRDP1-${var.account_name}-${var.vpc_owner}"
	"bws:Owner"         = "SQA"
	"bws:Service"       = "Software Quality Assurance and Testing"
	"bws:Description"   = "Desktop for testers to gain access to their environment to test their application of choice."
  }
}

