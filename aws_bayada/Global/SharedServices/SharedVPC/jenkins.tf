module "jenkins" {
    #providers = "aws.shared_services"
    source = "../../../modules/m-jenkins"
    subnets_elb = "${module.vpc.subnets_private}"
    subnets_instances = "${module.vpc.subnets_private}"
    vpc_id = "${module.vpc.id}"
    key_name = "${var.jenkins_key_pair}"
    r53_zone_name = "bayadawebservices.com"
}


