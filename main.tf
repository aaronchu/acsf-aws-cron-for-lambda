data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

data "aws_lambda_function" "lambda" {
  function_name = var.lambda_name
}

resource "aws_cloudwatch_event_rule" "schedule_rule" {
  name                = var.cron_name
  description         = "Scheduled lambda function"
  schedule_expression = "cron(${var.cron_schedule})" # Trigger at 12:00 PM (UTC) every day
}

resource "aws_cloudwatch_event_target" "lambda_target" {
  rule      = aws_cloudwatch_event_rule.schedule_rule.name
  target_id = "lambda-target-${var.cron_name}"
  arn       = data.aws_lambda_function.lambda.arn
  input     = var.lambda_payload
}

resource "aws_lambda_permission" "allow_cloudwatch" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = data.aws_lambda_function.lambda.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.schedule_rule.arn
}
