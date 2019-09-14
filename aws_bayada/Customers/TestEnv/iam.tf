resource "aws_iam_instance_profile" "S3_profile" {
  name_prefix     = "S3_access_profile-${var.user_env}"
  provider        = "aws.customer_account"
  role            = "${aws_iam_role.S3_role.name}"
}

resource "aws_iam_role" "S3_role" {
  name_prefix         = "S3_access_role-${var.user_env}"
  provider            = "aws.customer_account"
  assume_role_policy  = <<EOF
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

resource "aws_iam_role_policy" "S3_FullAccess_policy" {
  name_prefix   = "S3_policy-${var.user_env}"
  provider      = "aws.customer_account"
  role          = "${aws_iam_role.S3_role.id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

