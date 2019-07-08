output "s3_id" {
  value = "${aws_s3_bucket.terraform.id}"
}

output "s3_arn" {
  value = "${aws_s3_bucket.terraform.arn}"
}

output "dynamo_id" {
  value = "${aws_dynamodb_table.dynamodb-terraform-lock.id}"
}

output "dynamo_arn" {
  value = "${aws_dynamodb_table.dynamodb-terraform-lock.arn}"
}
