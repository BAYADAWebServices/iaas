resource "aws_iam_instance_profile" "main" {
  name_prefix = "${local.app_name}"
  role        = "${aws_iam_role.main.name}"
}

resource "aws_iam_role" "main" {
  name_prefix = "${local.app_name}-ec2"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}
