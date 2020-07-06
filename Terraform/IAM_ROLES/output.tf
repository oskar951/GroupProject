output "iam_instance_profile" {
  value = "${aws_iam_instance_profile.main_profile.name}"
}

output "lambda_role" {
  value = "${aws_iam_role.lambdaIAM.arn}"
}