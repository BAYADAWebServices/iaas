resource "aws_flow_log" "existing_bucket" {
  count                = "${var.enable_flow_logs * var.flow_log_bucket_exists}"
  log_destination      = "${data.aws_s3_bucket.flow_logs.arn}"
  log_destination_type = "s3"
  traffic_type         = "ALL"
  vpc_id               = "${aws_vpc.main.id}"
}

resource "aws_flow_log" "new_bucket" {
  count                = "${var.enable_flow_logs - var.flow_log_bucket_exists}"
  log_destination      = "${aws_s3_bucket.flow_logs.arn}"
  log_destination_type = "s3"
  traffic_type         = "ALL"
  vpc_id               = "${aws_vpc.main.id}"
}

resource "aws_s3_bucket" "flow_logs" {
  count  = "${var.enable_flow_logs - var.flow_log_bucket_exists}"
  bucket = "${var.flow_log_bucket}"
  acl    = "private"
  force_destroy = true
}
