resource "aws_cloudwatch_event_rule" "inspector_event_schedule" {
  count               = var.enable_scheduled_event ? 1 : 0
  name                = "${var.name_prefix}-inspector-schedule"
  description         = "Trigger an Inspector Assessment"
  schedule_expression = var.schedule_expression
}

resource "aws_cloudwatch_event_target" "inspector_event_target" {
  count    = var.enable_scheduled_event ? 1 : 0
  rule     = aws_cloudwatch_event_rule.inspector_event_schedule[0].name
  arn      = aws_inspector_assessment_template.template.arn
  role_arn = aws_iam_role.inspector_event_role[0].arn
}
