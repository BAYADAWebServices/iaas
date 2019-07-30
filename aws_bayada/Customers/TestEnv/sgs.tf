resource "aws_security_group" "web1" {
  provider                    = "aws.customer_account"
  name        = "sgWEB1-${var.account_name}-${var.vpc_owner}"
  vpc_id      = "${module.vpc.id}"
  
  tags = {
	Name = "sgWEB1-${var.account_name}-${var.vpc_owner}"
  }  
}

resource "aws_security_group_rule" "web1-all-in" {
  provider                    = "aws.customer_account"
  type                     = "ingress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  security_group_id        = "${aws_security_group.web1.id}"
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "web1-all-out" {
  provider                    = "aws.customer_account"
  type                     = "egress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  security_group_id        = "${aws_security_group.web1.id}"
  cidr_blocks = ["0.0.0.0/0"]
}



resource "aws_security_group" "web2" {
  provider                    = "aws.customer_account"
  name        = "sgWEB2-${var.account_name}-${var.vpc_owner}"
  vpc_id      = "${module.vpc.id}"
  
  tags = {
	Name = "sgWEB2-${var.account_name}-${var.vpc_owner}"
  }  
}

resource "aws_security_group_rule" "web2-all-in" {
  provider                    = "aws.customer_account"
  type                     = "ingress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  security_group_id        = "${aws_security_group.web2.id}"
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "web2-all-out" {
  provider                    = "aws.customer_account"
  type                     = "egress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  security_group_id        = "${aws_security_group.web2.id}"
  cidr_blocks = ["0.0.0.0/0"]
}



resource "aws_security_group" "db1" {
  provider                    = "aws.customer_account"
  name        = "sgDB1-${var.account_name}-${var.vpc_owner}"
  vpc_id      = "${module.vpc.id}"
  
  tags = {
	Name = "sgDB1-${var.account_name}-${var.vpc_owner}"
  }  
}

resource "aws_security_group_rule" "db1-all-in" {
  provider                    = "aws.customer_account"
  type                     = "ingress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  security_group_id        = "${aws_security_group.db1.id}"
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "db1-all-out" {
  provider                    = "aws.customer_account"
  type                     = "egress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  security_group_id        = "${aws_security_group.db1.id}"
  cidr_blocks = ["0.0.0.0/0"]
}


resource "aws_security_group" "db2" {
  provider                    = "aws.customer_account"
  name        = "sgDB2-${var.account_name}-${var.vpc_owner}"
  vpc_id      = "${module.vpc.id}"
  
  tags = {
	Name = "sgDB2-${var.account_name}-${var.vpc_owner}"
  }  
}

resource "aws_security_group_rule" "db2-all-in" {
  provider                    = "aws.customer_account"
  type                     = "ingress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  security_group_id        = "${aws_security_group.db2.id}"
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "db2-all-out" {
  provider                    = "aws.customer_account"
  type                     = "egress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  security_group_id        = "${aws_security_group.db2.id}"
  cidr_blocks = ["0.0.0.0/0"]
}



resource "aws_security_group" "dc1" {
  provider                    = "aws.customer_account"
  name        = "sgDC1-${var.account_name}-${var.vpc_owner}"
  vpc_id      = "${module.vpc.id}"
  
  tags = {
	Name = "sgDC1-${var.account_name}-${var.vpc_owner}"
  }  
}

resource "aws_security_group_rule" "dc1-all-in" {
  provider                    = "aws.customer_account"
  type                     = "ingress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  security_group_id        = "${aws_security_group.dc1.id}"
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "dc1-all-out" {
  provider                    = "aws.customer_account"
  type                     = "egress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  security_group_id        = "${aws_security_group.dc1.id}"
  cidr_blocks = ["0.0.0.0/0"]
}



resource "aws_security_group" "rdp1" {
  provider                    = "aws.customer_account"
  name        = "sgRDP1-${var.account_name}-${var.vpc_owner}"
  vpc_id      = "${module.vpc.id}"
  
  tags = {
	Name = "sgRDP1-${var.account_name}-${var.vpc_owner}"
  }  
}

resource "aws_security_group_rule" "rdp1-all-in" {
  provider                    = "aws.customer_account"
  type                     = "ingress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  security_group_id        = "${aws_security_group.rdp1.id}"
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "rdp1-all-out" {
  provider                    = "aws.customer_account"
  type                     = "egress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  security_group_id        = "${aws_security_group.rdp1.id}"
  cidr_blocks = ["0.0.0.0/0"]
}


