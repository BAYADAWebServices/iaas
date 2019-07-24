resource "aws_dynamodb_table" "dynamodb-terraform-lock" {
  name           = "${lower(var.account_name_friendly)}-terraform-lock-table"
  hash_key       = "LockID"
  read_capacity  = 5
  write_capacity = 5

  attribute {
    name = "LockID"
    type = "S"
  }

  tags {
    Name              = "${var.account_name_friendly}-Terraform-Lock-DynamoDB-Table"
	"bws:Application" = "Terraform"
	"bws:Owner"       = "SES"
	"bws:Service"     = "Enterprise Servers and Data Storage"
  }
}
