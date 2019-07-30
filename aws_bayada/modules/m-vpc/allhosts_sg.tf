resource "aws_security_group" "allhosts" {

  name = "allhosts"
  
  vpc_id = "${aws_vpc.main.id}"

  tags {
    Name              = "sg${var.tag_name}-allhosts"
	"bws:Description" = "Security group for all instances"
    "bws:Service"     = "${var.tag_service}"
    "bws:Office"      = "${var.tag_office}"
    "bws:Environment" = "${var.tag_environment}"
    "bws:Customer"    = "${var.tag_customer}"
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
