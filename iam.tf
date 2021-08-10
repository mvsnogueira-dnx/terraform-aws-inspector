data "aws_iam_policy_document" "inspector_event_role_policy" {
  count = var.enable_scheduled_event ? 1 : 0
  statement {
    sid = "StartAssessment"
    actions = [
      "inspector:StartAssessmentRun",
    ]
    resources = [
      "*"
    ]
  }
}

resource "aws_iam_role" "inspector_event_role" {
  count = var.enable_scheduled_event ? 1 : 0
  name  = "${var.name_prefix}-${var.region}-inspector-event-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "events.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "inspector_event" {
  count = var.enable_scheduled_event ? 1 : 0
  name   = "${var.name_prefix}-${var.region}-inspector-event-policy"
  role   = aws_iam_role.inspector_event_role[0].id
  policy = data.aws_iam_policy_document.inspector_event_role_policy[0].json
}