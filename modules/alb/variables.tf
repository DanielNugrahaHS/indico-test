variable "name_prefix" {
  description = "Prefix for naming resources"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for ALB"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "internal" {
  description = "Is this an internal ALB?"
  type        = bool
  default     = false
}

variable "target_port" {
  description = "Port used by target group"
  type        = number
  default     = 80
}

variable "health_check_path" {
  description = "Path for ALB health check"
  type        = string
  default     = "/"
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}
