
resource "aws_inspector_assessment_target" "target" {
  name = "${var.name_prefix}-${var.region}-assessment-target"
}

resource "aws_inspector_assessment_template" "template" {
  name               = "${var.name_prefix}-${var.region}-assessment-template"
  target_arn         = aws_inspector_assessment_target.target.arn
  duration           = var.assessment_duration
  rules_package_arns = var.assessment_ruleset
}