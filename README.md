# terraform-aws-template

[![Lint Status](https://github.com/DNXLabs/terraform-aws-template/workflows/Lint/badge.svg)](https://github.com/DNXLabs/terraform-aws-template/actions)
[![LICENSE](https://img.shields.io/github/license/DNXLabs/terraform-aws-template)](https://github.com/DNXLabs/terraform-aws-template/blob/master/LICENSE)

<!--- BEGIN_TF_DOCS --->
# Terraform-aws-inspector

A terraform module to deploy Amazon Inspector.

The following resources will be created:

- IAM Roles and Policies
- Cloudwatch events and rules
- AWS Inspector Assessment target
- AWS Inspector Assessment templates

# Optional

- enable_scheduled_event - Default true; A way to disable Inspector from running on a schedule
- schedule_expression - Default rate(7 days); How often to run an Inspector assessment. See AWS Schedule Expression documentation for more info on formatting.s
- assessment_duration - Default 3600; How long the assessment runs in seconds.
- ruleset_cve - Default true; Includes the Common Vulnerabilties and Exposures ruleset in the Inspector assessment.
- ruleset_cis - Default true; Includes the CIS Benchmarks ruleset in the Inspector assessment.
- ruleset_security_best_practices - Default true; Includes the AWS Security Best Practices ruleset in the Inspector assessment.
- ruleset_network_reachability - Default true; Includes the Network Reachability ruleset in the Inspector assessment.

# Example

provider "aws" {
  alias   = "sydney"
  region  = "ap-southeast-2"
}

module "inspector-deployment" {

      providers = {
            aws = aws.sydney
  }

  name_prefix                     = "inspector"
  enable_scheduled_event          = true
  schedule_expression             = "cron(0 14 * * ? *)"
  ruleset_cve                     = true
  ruleset_cis                     = false
  ruleset_security_best_practices = true
  ruleset_network_reachability    = false
  account_id                      = 123456789
}
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13.0 |

## Providers

No provider.

## Inputs

No input.

## Outputs

No output.

<!--- END_TF_DOCS --->

## Authors

Module managed by [DNX Solutions](https://github.com/DNXLabs).

## License

Apache 2 Licensed. See [LICENSE](https://github.com/DNXLabs/terraform-aws-template/blob/master/LICENSE) for full details.