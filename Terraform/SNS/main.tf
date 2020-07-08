resource "aws_sns_topic" "recovery" {
  name = "user-updates-topic"
}

resource "aws_sns_topic_subscription" "user_updates_sqs_target" {
  topic_arn = aws_sns_topic.recovery.arn
  protocol  = "lambda"
  endpoint  = var.lambda_recovery
}