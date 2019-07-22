resource "tls_private_key" "tlskey" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  provider   = "aws.customer_account"
  key_name   = "${var.key_name}"
  public_key = "${tls_private_key.tlskey.public_key_openssh}"
}

resource "aws_instance" "web1" {
  provider                    = "aws.customer_account"
  ami                         = "${var.ami_web1}"
  instance_type               = "${var.web1_instance_size}"
  subnet_id                   = "${module.vpc.subnets_isolated[0]}"
  vpc_security_group_ids      = ["${aws_security_group.web1.id}"]
  key_name                    = "${aws_key_pair.generated_key.key_name}"
  tenancy                     = "default"
  associate_public_ip_address = "false"
  # depends_on = ["aws_ami_launch_permission.share_web_ami"]

  tags {
    Name              = "Web1"
    "bws:Application"   = "OrganizationServices"
    "bws:Application"   = "SingleSignOn"
    "bws:Application"   = "FindAnOffice"
    "bws:Service"       = "CustomApplication"
    "bws:Software"      = "IIS"
    "bws:owner"         = "SQA"
    "bws:Description"   = "Web server that hosts the OrgServices web applicaiton"
  }
}

resource "aws_instance" "web2" {
  provider                    = "aws.customer_account"
  ami                         = "${var.ami_web2}"
  instance_type               = "${var.web2_instance_size}"
  subnet_id                   = "${module.vpc.subnets_isolated[0]}"
  vpc_security_group_ids      = ["${aws_security_group.web2.id}"]
  key_name                    = "${aws_key_pair.generated_key.key_name}"
  tenancy                     = "default"
  associate_public_ip_address = "false"
  # depends_on = ["aws_ami_launch_permission.share_web_ami"]

  tags {
    Name              = "Web2"
    "bws:Application"   = "MasterData"
    "bws:Service"       = "CustomApplication"
    "bws:Software"      = "IIS"
    "bws:owner"         = "SQA"
    "bws:Description"   = "Web server that hosts the MasterData web applicaiton"
  }
}

resource "aws_instance" "db1" {
  provider                    = "aws.customer_account"
  ami                         = "${var.ami_db1}"
  instance_type               = "${var.db1_instance_size}"
  subnet_id                   = "${module.vpc.subnets_isolated[0]}"
  vpc_security_group_ids      = ["${aws_security_group.db1.id}"]
  key_name                    = "${aws_key_pair.generated_key.key_name}"
  tenancy                     = "default"
  associate_public_ip_address = "false"
  # depends_on = ["aws_ami_launch_permission.share_db1_ami"]

  tags {
    Name              = "DB1"
    "bws:Application"   = "MasterData"
    "bws:Software"      = "SQLServer2012"
  }
}

resource "aws_instance" "db2" {
  provider                    = "aws.customer_account"
  ami                         = "${var.ami_db2}"
  instance_type               = "${var.db2_instance_size}"
  subnet_id                   = "${module.vpc.subnets_isolated[0]}"
  vpc_security_group_ids      = ["${aws_security_group.db2.id}"]
  key_name                    = "${aws_key_pair.generated_key.key_name}"
  tenancy                     = "default"
  associate_public_ip_address = "false"
 #  depends_on = ["aws_ami_launch_permission.share_db2_ami"]

  tags {
    Name              = "DB2"
    "bws:Application"   = "OrganizationServices"
    "bws:Application"   = "SingleSignOn"
    "bws:Application"   = "FindAnOffice"
    "bws:Service"       = "CustomApplication"
    "bws:Software"      = "SQLServer2012"
    "bws:owner"         = "SQA"
    "bws:Description"   = "SQL server that hosts the OrgServices database"
  }
}

resource "aws_instance" "dc1" {
  provider                    = "aws.customer_account"
  ami                         = "${var.ami_dc1}"
  instance_type               = "${var.dc1_instance_size}"
  subnet_id                   = "${module.vpc.subnets_isolated[0]}"
  vpc_security_group_ids      = ["${aws_security_group.dc1.id}"]
  key_name                    = "${aws_key_pair.generated_key.key_name}"
  tenancy                     = "default"
  associate_public_ip_address = "false"
  # depends_on = ["aws_ami_launch_permission.share_dc1_ami"]


  tags {
    Name                = "DomainController"
    "bws:Application"   = "ActiveDirectory"
    "bws:Service"       = "Hosting"
    "bws:owner"         = "Hosting"
  }
}

resource "aws_instance" "rdp1" {
  provider                    = "aws.customer_account"
  ami                         = "${var.ami_rdp1}"
  instance_type               = "${var.rdp1_instance_size}"
  subnet_id                   = "${module.vpc.subnets_isolated[0]}"
  vpc_security_group_ids      = ["${aws_security_group.rdp1.id}"]
  key_name                    = "${aws_key_pair.generated_key.key_name}"
  tenancy                     = "default"
  associate_public_ip_address = "false"
  # depends_on = ["aws_ami_launch_permission.share_rdp1_ami"]

  tags {
    Name            = "RDP1"
  }
}

