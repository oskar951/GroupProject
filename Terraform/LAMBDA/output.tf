output "lambdaSnapshotArn" {
  value = "${aws_lambda_function.createSnapshot.arn}"
}

output "lambdaImageArn" {
  value = "${aws_lambda_function.createImage.arn}"
}

output "lambdaInstanceArn" {
  value = "${aws_lambda_function.createInstance.arn}"
}

