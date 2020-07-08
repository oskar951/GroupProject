resource "aws_cloudwatch_dashboard" "main" {
  dashboard_name = "my-dashboard"

  dashboard_body = <<EOF
 {
   "widgets": [
       {
          "type":"metric",
          "x":0,
          "y":0,
          "width":12,
          "height":6,
          "properties":{
             "metrics":[
                [
                   "AWS/EC2",
                   "CPUUtilization",
                   "InstanceId",
                   "${var.instanceID}"
                ]
             ],
             "period":300,
             "stat":"Average",
             "region":"eu-west-1",
             "title":"WebServer CPU Usage"
          }
       },
       {
        "type":"metric",
        "x":0,
        "y":20,
        "width":12,
        "height":6,
        "properties":{
          "metrics":[
          [ "AWS/EC2", "DiskReadBytes", "InstanceId", "${var.instanceID}",{ "id": "m1" } ],
          [ ".", ".", ".", "${var.instanceID}", { "id": "m2" } ],
          [ { "expression": "SUM(METRICS())", "label": "Sum of DiskReadbytes", "id": "e3" } ]
          ],
          "view": "timeSeries",
          "stacked": false,
          "period":300,
          "stat":"Average",
          "region":"eu-west-1",
          "title":"Webserver Disk Usage"
        }
      }
   ]
 }
 EOF
}

resource "aws_cloudwatch_event_rule" "image_rule" {
  name        = "check-for-new-snapshots"
  description = "Checks for new snapshots and triggers image conversion"

  event_pattern = <<PATTERN
{
  "source": [
    "aws.ec2"
  ],
  "detail-type": [
    "EBS Snapshot Notification"
  ],
  "detail": {
    "event": [
      "createSnapshot"
    ],
    "result": [
      "succeeded"
    ]
  }
}
PATTERN
}

resource "aws_cloudwatch_event_target" "image" {
  target_id = "image"
  rule      = aws_cloudwatch_event_rule.image_rule.name
  arn       = var.lambda_image_arn
}

resource "aws_cloudwatch_metric_alarm" "ec2_health_alarm" {
  alarm_name          = "EC2_SERVER_ALARM"
  comparison_operator = "LessThanThreshold"
  threshold           = "1"
  evaluation_periods  = "1"
  metric_name         = "HealthyHostCount"
  namespace           = "AWS/EC2"
  period              = "60"
  statistic           = "Average"
  alarm_description   = "This metric monitors ec2 cpu utilization"
  actions_enabled     = "true"
  alarm_actions       = [var.instance_recovery_arn]
  treat_missing_data  = "notBreaching"
  dimensions = {
    InstanceId = var.instanceID
  }
}

resource "aws_cloudwatch_event_rule" "snapshot_rule" {
  name                = "snapshot_schedule"
  description         = "This event will run every 12 hours"
  schedule_expression = "rate(8 hours)"
  is_enabled          = true
}

resource "aws_cloudwatch_event_target" "snapshot-target" {
  rule = aws_cloudwatch_event_rule.snapshot_rule.name
  arn  = var.lambda_snapshot_arn
}