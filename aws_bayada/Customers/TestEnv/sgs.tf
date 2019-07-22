resource "aws_security_group" "web1" {
  provider                    = "aws.customer_account"
  name        = "web1"
  vpc_id      = "${module.vpc.id}"
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
  name        = "web2"
  vpc_id      = "${module.vpc.id}"
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
  name        = "db1"
  vpc_id      = "${module.vpc.id}"
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
  name        = "db2"
  vpc_id      = "${module.vpc.id}"
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
  name        = "dc1"
  vpc_id      = "${module.vpc.id}"
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
  name        = "rdp1"
  vpc_id      = "${module.vpc.id}"
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


