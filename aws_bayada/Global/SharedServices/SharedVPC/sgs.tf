resource "aws_security_group" "resolver" {
  name        = "ResolverSG"
  vpc_id      = "${module.vpc.id}"
}

resource "aws_security_group_rule" "resolver-tcp53-in" {
  type                     = "ingress"
  from_port                = 53
  to_port                  = 53
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.resolver.id}"
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "resolver-udp53-in" {
  type                     = "ingress"
  from_port                = 53
  to_port                  = 53
  protocol                 = "udp"
  security_group_id        = "${aws_security_group.resolver.id}"
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "resolver-all-out" {
  type                     = "egress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  security_group_id        = "${aws_security_group.resolver.id}"
  cidr_blocks = ["0.0.0.0/0"]
}