resource "aws_default_security_group" "sg_default" {

  vpc_id = "${aws_vpc.main.id}"

  ingress {
    self      = true
    protocol  = -1
    from_port = 0
    to_port   = 0
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  tags = {
    Name              = "sg${var.tag_name}-default"
	"bws:Description" = "Default Network ACL to allow all traffic in and out"
    "bws:Service"     = "${var.tag_service}"
    "bws:Office"      = "${var.tag_office}"
    "bws:Environment" = "${var.tag_environment}"
    "bws:Customer"    = "${var.tag_customer}"
	}
	
}
