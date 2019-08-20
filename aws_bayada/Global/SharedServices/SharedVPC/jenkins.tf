module "jenkins" {
    source = "../../../modules/m-jenkins"
    subnets_elb = "${module.vpc.subnets_private}"
    subnets_instances = "${module.vpc.subnets_private}"
    vpc_id = "${module.vpc.id}"
    key_name = "${var.jenkins_key_pair}"
    r53_zone_name = "${var.aws_route53_zone.private.name}"
}
