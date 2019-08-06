data "aws_availability_zones" "main" {

  state = "available"
}

data "aws_s3_bucket" "flow_logs" {

  count  = "${var.enable_flow_logs * var.flow_log_bucket_exists}"
  bucket = "${var.flow_log_bucket}"
}
