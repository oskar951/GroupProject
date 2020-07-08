resource "aws_lambda_function" "createSnapshot" {
  filename      = var.snapshot_filename
  function_name = var.snapshot_function_name
  role          = var.role
  runtime       = var.runtime
  handler       = var.snapshot_handler
}

resource "aws_lambda_function" "createImage" {
  filename      = var.image_filename
  function_name = var.image_function_name
  role          = var.role
  runtime       = var.runtime
  handler       = var.image_handler
}

resource "aws_lambda_function" "createInstance" {
  filename      = var.instance_filename
  function_name = var.instance_function_name
  role          = var.role
  runtime       = var.runtime
  handler       = var.instance_handler
}