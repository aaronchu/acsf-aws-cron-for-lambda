variable "environment_name" {
  description = "The environment in which this cron runs"
  type        = string
  default     = "production"
}

variable "cron_name" {
  description = "The name of this cron job"
  type        = string
}

variable "cron_schedule" {
  description = "The cron schedule on which to run the lambda"
  type        = string
}

variable "lambda_name" {
  description = "Name of the lambda to run"
  type        = string
}

variable "lambda_payload" {
  description = "Payload string to submit to the lambda"
  type        = string
}