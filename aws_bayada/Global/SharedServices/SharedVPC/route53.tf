resource "aws_route53_zone" "private" {
  name = "bws.cloud"

  vpc {
    vpc_id = "${module.vpc.id}"
  }
}

/*
resource "aws_route53_resolver_endpoint" "inbound_resolver" {
  name      = "Inbound Resolver"
  direction = "INBOUND"
  security_group_ids = [
    "${aws_security_group.resolver.id}"
  ]
  ip_address {
    subnet_id = "${module.vpc.subnets_private[0]}"
    ip        = "10.20.0.250"
  }
  ip_address {
    subnet_id = "${module.vpc.subnets_private[1]}
    ip        = "10.20.1.250"
  }
}
*/
