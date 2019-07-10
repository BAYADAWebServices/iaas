output "sg_efs" {
  value = "${aws_security_group.efs.id}"
  description = "Security group for EFS"
}

output "efs_id" {
  value = "${aws_efs_file_system.main.id}"
  description = "Filesystem ID for EFS"
}

output "route53_dns" {
  value = "${aws_route53_record.elb.*.fqdn}"
  description = "Route 53 fully-qualified domain name for the ELB"
}

output "elb_dns" {
  value = "${aws_lb.main.dns_name}"
  description = "DNS of the ELB itself"
}
