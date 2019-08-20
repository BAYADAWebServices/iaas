resource "aws_dynamodb_table" "dynamodb-terraform-lock" {
  name           = "${var.dynamo_table_name}"
  hash_key       = "LockID"
  read_capacity  = 5
  write_capacity = 5

  attribute {
    name = "LockID"
    type = "S"
  }

  tags {
    Name        = "Terraform Lock Table"
  }
}
