resource "aws_route53_zone" "private" {
  #provider = "aws.shared_services"
  name     = "bws.cloud"
  
  vpc {
    vpc_id = "${module.vpc.id}"
  }
}


resource "aws_route53_resolver_endpoint" "inbound_resolver" {
  #provider = "aws.shared_services"
  name      = "Inbound Resolver"
  direction = "INBOUND"

  security_group_ids = [
    "${aws_security_group.resolver.id}"
  ]

  ip_address {
    subnet_id = "${module.vpc.subnets_private[0]}"
    ip        = "10.20.0.94"
  }

  ip_address {
    subnet_id = "${module.vpc.subnets_private[1]}"
    ip        = "10.20.0.126"
  }

}


data "aws_route53_zone" "main" {
  name = "bayadawebservices.com"
  provider = "aws.route53_account"
}

resource "aws_route53_record" "elb" {
  provider = "aws.route53_account"
  zone_id  = "${data.aws_route53_zone.main.zone_id}"
  name     = "${module.jenkins.route53_dns}"
  type     = "A"

  alias {
    name                   = "${module.jenkins.elb_dns}"
    zone_id                = "${module.jenkins.elb_zone_id}"
    evaluate_target_health = "false"
  }
}

output "route53_dns" {
  value = "${aws_route53_record.elb.*.fqdn}"
  description = "Route 53 fully-qualified domain name for the ELB"
}
