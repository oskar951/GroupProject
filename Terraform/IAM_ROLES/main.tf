################################################ EC2 IAM ROLE ################################################

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

################################################ LAMBDA IAM ROLE ################################################

resource "aws_iam_role" "lambdaIAM" {
  name = var.iam_lambda_role_name

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "AWSLambdaBasicExecutionRole" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  role       = aws_iam_role.lambdaIAM.name
}

resource "aws_iam_role_policy_attachment" "lambda-EC2InstanceConnect" {
  policy_arn = "arn:aws:iam::aws:policy/EC2InstanceConnect"
  role       = aws_iam_role.lambdaIAM.name
}

resource "aws_iam_role_policy_attachment" "lambda-AmazonEC2FullAccess" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
  role       = aws_iam_role.lambdaIAM.name
}