resource "aws_network_acl" "main" {

  vpc_id = "${aws_vpc.main.id}"

  tags = {
    Name = "acl${var.tag_name}"
  }
}

resource "aws_network_acl_rule" "acl_rule_inbound_main" {

  network_acl_id = "${aws_network_acl.main.id}"
  rule_number    = 100
  egress         = false
  protocol       = "-1"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 0
  to_port        = 0
  
}

resource "aws_network_acl_rule" "acl_rule_outbound_main" {

  network_acl_id = "${aws_network_acl.main.id}"
  rule_number    = 100
  egress         = true
  protocol       = "-1"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 0
  to_port        = 0
  
}
