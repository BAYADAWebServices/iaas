resource "aws_instance" "web1" {
  ami                         = "${var.ami_web1}"
  instance_type               = "${var.ec2_instance_size}"
  subnet_id                   = ""
  vpc_security_group_ids      = ["${aws_security_group.web1.id}"]
  key_name                    = "${var.ec2_key_name}"
  tenancy                     = "default"
  ebs_optimized               = true
  associate_public_ip_address = "false"

  root_block_device {
    volume_size           = "${var.web1_volume_size_root}"
    volume_type           = "gp2"
    delete_on_termination = "true"
  }

  tags {
    Name              = "Web1"
    bws:Application   = "OrganizationServices"
    bws:Application   = "SingleSignOn"
    bws:Application   = "FindAnOffice"
    bws:Service       = "CustomApplication"
    bws:Software      = "IIS"
    bws:owner         = "SQA"
    bws:Description   = "Web server that hosts the OrgServices web applicaiton"
  }
}

resource "aws_instance" "web2" {
  ami                         = "${var.ami_web2}"
  instance_type               = "${var.web2_instance_size}"
  subnet_id                   = ""
  vpc_security_group_ids      = ["${aws_security_group.web1.id}"]
  key_name                    = "${var.ec2_key_name}"
  tenancy                     = "default"
  ebs_optimized               = true
  associate_public_ip_address = "false"

  root_block_device {
    volume_size           = "${var.web2_volume_size_root}"
    volume_type           = "gp2"
    delete_on_termination = "true"
  }

  tags {
    Name              = "Web2"
    bws:Application   = "MasterData"
    bws:Service       = "CustomApplication"
    bws:Software      = "IIS"
    bws:owner         = "SQA"
    bws:Description   = "Web server that hosts the MasterData web applicaiton"
  }
}

resource "aws_instance" "db1" {
  ami                         = "${var.ami_db1}"
  instance_type               = "${var.ec2_instance_size}"
  subnet_id                   = ""
  vpc_security_group_ids      = ["${aws_security_group.web1.id}"]
  key_name                    = "${var.ec2_key_name}"
  tenancy                     = "default"
  ebs_optimized               = true
  associate_public_ip_address = "false"

  root_block_device {
    volume_size           = "${var.db1_volume_size_root}"
    volume_type           = "gp2"
    delete_on_termination = "true"
  }

  tags {
    Name              = "DB1"
    bws:Application   = "MasterData"
    bws:Software      = "SQLServer2012"
  }
}

resource "aws_instance" "db2" {
  ami                         = "${var.ami_db2}"
  instance_type               = "${var.ec2_instance_size}"
  subnet_id                   = ""
  vpc_security_group_ids      = ["${aws_security_group.web1.id}"]
  key_name                    = "${var.ec2_key_name}"
  tenancy                     = "default"
  ebs_optimized               = true
  associate_public_ip_address = "false"

  root_block_device {
    volume_size           = "${var.db2_volume_size_root}"
    volume_type           = "gp2"
    delete_on_termination = "true"
  }

  tags {
    Name              = "DB2"
    bws:Application   = "OrganizationServices"
    bws:Application   = "SingleSignOn"
    bws:Application   = "FindAnOffice"
    bws:Service       = "CustomApplication"
    bws:Software      = "SQLServer2012"
    bws:owner         = "SQA"
    bws:Description   = "SQL server that hosts the OrgServices database"
  }
}

resource "aws_instance" "dc1" {
  ami                         = "${var.ami_dc1}"
  instance_type               = "${var.ec2_instance_size}"
  subnet_id                   = ""
  vpc_security_group_ids      = ["${aws_security_group.web1.id}"]
  key_name                    = "${var.ec2_key_name}"
  tenancy                     = "default"
  ebs_optimized               = true
  associate_public_ip_address = "false"

  root_block_device {
    volume_size           = "${var.dc1volume_size_root}"
    volume_type           = "gp2"
    delete_on_termination = "true"
  }

  tags {
    Name            = "$DomainController"
    bws:Application   = "ActiveDirectory"
    bws:Service       = "Hosting"
    bws:owner         = "Hosting"
  }
}

resource "aws_instance" "rdp1" {
  ami                         = "${var.ami_rdp1}"
  instance_type               = "${var.ec2_instance_size}"
  subnet_id                   = ""
  vpc_security_group_ids      = ["${aws_security_group.web1.id}"]
  key_name                    = "${var.ec2_key_name}"
  tenancy                     = "default"
  ebs_optimized               = true
  associate_public_ip_address = "false"

  root_block_device {
    volume_size           = "${var.rdp1.volume_size_root}"
    volume_type           = "gp2"
    delete_on_termination = "true"
  }

  tags {
    Name            = "RDP1"
  }
}

