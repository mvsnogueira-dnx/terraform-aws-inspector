# terraform-aws-inspector

[![Lint Status](https://github.com/DNXLabs/terraform-aws-template/workflows/Lint/badge.svg)](https://github.com/DNXLabs/terraform-aws-template/actions)
[![LICENSE](https://img.shields.io/github/license/DNXLabs/terraform-aws-template)](https://github.com/DNXLabs/terraform-aws-template/blob/master/LICENSE)

<!--- BEGIN_TF_DOCS --->

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13.0 |

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| account\_id | AWS Account ID | `string` | n/a | yes |
| assessment\_duration | The duration of the Inspector assessment run | `string` | `"3600"` | no |
| enable\_scheduled\_event | Enable Cloudwatch Events to schedule an assessment | `bool` | `true` | no |
| random\_id\_prefix | random\_id\_prefix | `any` | n/a | yes |
| region | AWS Region. | `any` | n/a | yes |
| ruleset\_cis | Enable CIS Operating System Security Configuration Benchmarks Ruleset | `bool` | `true` | no |
| ruleset\_cve | Enable Common Vulnerabilities and Exposures Ruleset | `bool` | `true` | no |
| ruleset\_network\_reachability | Enable AWS Network Reachability Ruleset | `bool` | `true` | no |
| ruleset\_security\_best\_practices | Enable AWS Security Best Practices Ruleset | `bool` | `true` | no |
| schedule\_expression | AWS Schedule Expression: https://docs.aws.amazon.com/AmazonCloudWatch/latest/events/ScheduledEvents.html | `string` | n/a | yes |

## Outputs

No output.

<!--- END_TF_DOCS --->

## Authors

Module managed by [DNX Solutions](https://github.com/DNXLabs).

## License

Apache 2 Licensed. See [LICENSE](https://github.com/DNXLabs/terraform-aws-template/blob/master/LICENSE) for full details.