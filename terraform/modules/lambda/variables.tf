variable "project_name" {
  description = "AWS Project Name"
  type        = string
  default     = "terraform-aws-free-tier-example"
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
  default     = ""
}

variable "subnet_ids" {
  description = "Subnet ID"
  type        = string
  default     = ""
}

variable "security_group_id" {
  description = "Security Group ID"
  type        = string
  default     = ""
}

variable "iam_role_arn" {
  description = "IAM Role ARN"
  type        = string
  default     = ""
}
