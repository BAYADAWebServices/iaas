resource "aws_security_group" "instance" {
  name_prefix = "${local.app_name}"
  vpc_id      = "${var.vpc_id}"
}

resource "aws_security_group" "elb" {
  name_prefix = "${local.app_name}-elb"
  vpc_id      = "${var.vpc_id}"
}

resource "aws_security_group_rule" "instance" {
  count                    = "${length(var.ports_ingress_instance)}"
  type                     = "ingress"
  from_port                = "${var.ports_ingress_instance[count.index]}"
  to_port                  = "${var.ports_ingress_instance[count.index]}"
  protocol                 = "tcp"
  source_security_group_id = "${aws_security_group.elb.id}"
  security_group_id        = "${aws_security_group.instance.id}"
}

resource "aws_security_group_rule" "instance_egress" {
  type                     = "egress"
  from_port                = 0
  to_port                  = 0
  protocol                 = -1
  source_security_group_id = "${aws_security_group.elb.id}"
  security_group_id        = "${aws_security_group.instance.id}"
}

resource "aws_security_group_rule" "elb" {
  count                    = "${length(var.ports_ingress_elb)}"
  type                     = "ingress"
  from_port                = "${var.ports_ingress_elb[count.index]}"
  to_port                  = "${var.ports_ingress_elb[count.index]}"
  protocol                 = "tcp"
  cidr_blocks              = ["${var.cidrs_ingress_elb}"]
  security_group_id        = "${aws_security_group.elb.id}"
}

resource "aws_security_group_rule" "elb_egress" {
  type                     = "egress"
  from_port                = 0
  to_port                  = 0
  protocol                 = -1
  cidr_blocks              = ["${var.cidrs_ingress_elb}"]
  security_group_id        = "${aws_security_group.elb.id}"
}

resource "aws_security_group" "efs" {
  name_prefix = "${local.app_name}"
  vpc_id      = "${var.vpc_id}"
}

resource "aws_security_group_rule" "efs_instance" {
  type                     = "ingress"
  from_port                = 2049
  to_port                  = 2049
  protocol                 = "tcp"
  source_security_group_id = "${aws_security_group.instance.id}"
  security_group_id        = "${aws_security_group.efs.id}"
}

resource "aws_security_group_rule" "efs_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = -1
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.efs.id}"
}
