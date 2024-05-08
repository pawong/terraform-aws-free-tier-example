variable "region" {
  description = "Region for AWS resources"
  type        = string
  default     = "us-west-2"
}

variable "project_name" {
  description = "AWS Project Name"
  type        = string
  default     = "terraform-aws-gh-action"
}

variable "role_arn" {
  description = "AWS IAM Role ARN"
  type        = string
}

variable "keepalive_arn" {
  description = "AWS Lambda ARN"
  type        = string
}
