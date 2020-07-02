resource "aws_iam_role" "main_role" {
  name = var.iam_role_name

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

resource "aws_iam_instance_profile" "main_profile" {
  name = var.iam_profile_name
  role = aws_iam_role.main_role.name
}

resource "aws_iam_role_policy" "main_policy" {
  name = var.iam_policy_name
  role = aws_iam_role.main_role.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "vpc:*",
        "ec2:*",
        "eks:*", 
        "rds:*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

