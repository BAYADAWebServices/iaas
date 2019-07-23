data "aws_ami" "rdp1" {
  provider    = "aws.customer_account"
  most_recent = true
  owners      = ["amazon"]  

  filter {
    name   = "name"
    values = ["Windows_Server-2012-R2_RTM-English-64Bit-Base-*"]
  }

}