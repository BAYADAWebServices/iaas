data "aws_ami" "web1" {
  filter {
    name   = "web1_ami_name"
    values = ["${var.ami_web1}"]
  }

  most_recent = true
  owners      = ["self"]
}

data "aws_ami" "web2" {
  filter {
    name   = "web2_ami_name"
    values = ["${var.ami_web2}"]
  }

  most_recent = true
  owners      = ["self"]
}

data "aws_ami" "db1" {
  filter {
    name   = "db1_ami_name"
    values = ["${var.ami_db1}"]
  }

  most_recent = true
  owners      = ["self"]
}

data "aws_ami" "db2" {
  filter {
    name   = "db2_ami_name"
    values = ["${var.ami_db2}"]
  }

  most_recent = true
  owners      = ["self"]
}

data "aws_ami" "dc1" {
  filter {
    name   = "dc1_ami_name"
    values = ["${var.ami_dc1}"]
  }

  most_recent = true
  owners      = ["self"]
}

data "aws_ami" "rdp" {
  filter {
    name   = "rdp1_ami_name"
    values = ["${var.ami_rdp}"]
  }

  most_recent = true
  owners      = ["self"]
}