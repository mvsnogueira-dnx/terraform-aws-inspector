
locals {
  scheduled_count = var.enable_scheduled_event ? 1 : 0
  assessment_ruleset = compact([
    var.ruleset_cis ? "arn:aws:inspector:${var.region}:${var.account_id}:rulespackage/0-rExsr2X8" : "",
    var.ruleset_cve ? "arn:aws:inspector:${var.region}:${var.account_id}:rulespackage/0-gEjTy7T7" : "",
    var.ruleset_network_reachability ? "arn:aws:inspector:${var.region}:${var.account_id}:rulespackage/0-PmNV0Tcd" : "",
    var.ruleset_security_best_practices ? "arn:aws:inspector:${var.region}:${var.account_id}:rulespackage/0-R01qwB5Q" : "",
    ]
  )
}


resource "aws_inspector_assessment_target" "assessment" {
  name = "${var.name_prefix}-assessment-target"
}

resource "aws_inspector_assessment_template" "assessment" {
  name               = "${var.name_prefix}-assessment-template"
  target_arn         = aws_inspector_assessment_target.assessment.arn
  duration           = var.assessment_duration
  rules_package_arns = local.assessment_ruleset
}