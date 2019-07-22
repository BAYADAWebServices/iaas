resource "aws_security_group" "allhosts" {
  name = "allhosts"


  vpc_id = "${aws_vpc.main.id}"

  tags {
    Name        = "${var.tag_name}"
    CostCenter  = "${var.tag_costcenter}"
    Environment = "${var.tag_environment}"
    Application = "${var.tag_application}"
    Customer    = "${var.tag_customer}"
  }
}

resource "aws_security_group_rule" "ssh_self" {

  security_group_id = "${aws_security_group.allhosts.id}"

  type      = "ingress"
  from_port = 22
  to_port   = 22
  protocol  = "tcp"
  self      = "true"
}

resource "aws_security_group_rule" "all_admin" {

  security_group_id = "${aws_security_group.allhosts.id}"

  type        = "ingress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["${var.adminip}/32"]
}

resource "aws_security_group_rule" "egress" {

  security_group_id = "${aws_security_group.allhosts.id}"

  type        = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}
