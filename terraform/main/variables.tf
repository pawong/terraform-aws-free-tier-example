variable "region" {
  description = "Region for AWS resources"
  type        = string
  default     = "us-west-2"
}

variable "project_name" {
  description = "AWS Project Name"
  type        = string
  default     = "terraform-aws-free-tier-example"
}
