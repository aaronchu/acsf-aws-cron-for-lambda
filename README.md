# `acsf-aws-cron-for-lambda` Terraform Module

## Purpose

Execute a lambda based on a cron schedule.

## Inputs

| Variable | Type | Example | Description |
| - | - | - | - |
| `environment_name` | `string` | `production` | (required) The environment in which this cron runs. |
| `cron_name` | `string` | `daily-trigger` | (required) The name of this cron job. |
| `cron_schedule` | `string` | `0 12 * * ? *` | (required) The cron schedule on which to run the lambda. |
| `lambda_name` | `string` | `my-function` |(required) The name of the lambda to run. It must be in the same AWS account and region. |
| `lambda_payload` | `string` | `{"input": "value"}` |(optional) The payload for the lambda. |

## Usage

Using the module:

```
module "lambda_cron" {
  source           = "git::https://github.com/aaronchu/acsf-aws-cron-for-lambda.git?ref=v0.1.0"
  environment_name = var.environment_name
  cron_name        = "my-cron-for-my-lambda"
  cron_schedule    = "30 14-20 ? * MON-FRI *" # UTC
  lambda_name      = "my-lambda"
  lambda_payload = jsonencode(
    {
      key = value
    }
  )
}
```

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.5.7 |
| aws | ~> 5.0 |

## Providers

`aws` (see requirements)

## Notes

1. Intended for hobbyist use only.
2. Built with `terraform` version `1.5.x` and intent to move to [`opentofu`](https://opentofu.org/) eventually.
