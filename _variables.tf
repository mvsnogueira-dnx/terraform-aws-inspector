variable "region" {
  description = "AWS Region."
}
variable "name_prefix" {
  description = "name prefix"
  default     = ""
}
variable "aws_account_id" {
  type        = string
  description = "AWS Account ID"
}

variable "assessment_duration" {
  type        = string
  description = "The duration of the Inspector assessment run"
  default     = "3600" # 1 hour
}

variable "enable_scheduled_event" {
  type        = bool
  description = "Enable Cloudwatch Events to schedule an assessment"
  default     = true
}

variable "schedule_expression" {
  type        = string
  description = "AWS Schedule Expression: https://docs.aws.amazon.com/AmazonCloudWatch/latest/events/ScheduledEvents.html"
}

variable "assessment_ruleset" {
  type        = list(string)
  description = <<-DOC
    A list of AWS Inspector rules that should run on a periodic basis.
    Possible rules: Common Vulnerabilities and Exposures(CVE) / CIS Operating System Security Configuration Benchmarks (CIS)/ Network Reachability / Security Best Practices
    Get the Inspector rule arns by region: https://docs.aws.amazon.com/inspector/latest/userguide/inspector_rules-arns.html
    example: assessment_ruleset   = ["arn:aws:inspector:us-east-2:646659390643:rulespackage/0-m8r61nnh"]
  DOC
}