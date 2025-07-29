variable "name_prefix" {
  description = "Prefix for resource names"
  type        = string
}

variable "cluster_name" {
  description = "ECS cluster name"
  type        = string
}

variable "cpu" {
  description = "CPU units for the task"
  type        = string
  default     = "256"
}

variable "memory" {
  description = "Memory for the task"
  type        = string
  default     = "512"
}

variable "container_definitions_json" {
  description = "Container definitions in JSON"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "assign_public_ip" {
  description = "Assign public IP"
  type        = bool
  default     = true
}

variable "desired_count" {
  description = "Number of ECS service tasks"
  type        = number
  default     = 1
}

variable "container_port" {
  description = "Port exposed by container"
  type        = number
  default     = 80
}

variable "tags" {
  description = "Tags for resources"
  type        = map(string)
  default     = {}
}
