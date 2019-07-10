module "jenkins" {
    source = "../../../modules/m-jenkins"
    subnets_elb = "${module.aws_vpc.subnets_public}"
    subnets_instances = "${module.aws_vpc.subnets_private}"
    vpc_id = "${module.aws_vpc.id}"
    key_name = "yours"

}