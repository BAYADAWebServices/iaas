/*data "aws_route53_zone" "main" {
  name = "${var.r53_zone_name}"
}

resource "aws_route53_record" "elb" {
  zone_id = "${data.aws_route53_zone.main.zone_id}"
  name    = "${local.subdomain}.${var.r53_zone_name}"
  type    = "A"

  alias {
    name                   = "${aws_lb.main.dns_name}"
    zone_id                = "${aws_lb.main.zone_id}"
    evaluate_target_health = "false"
  }
}
*/