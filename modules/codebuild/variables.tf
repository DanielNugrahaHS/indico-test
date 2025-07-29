variable "name_prefix" {
  description = "Prefix for resource names"
  type        = string
}

variable "compute_type" {
  description = "Build compute type"
  type        = string
  default     = "BUILD_GENERAL1_SMALL"
}

variable "image" {
  description = "Docker image for build environment"
  type        = string
  default     = "aws/codebuild/standard:7.0"
}

variable "privileged_mode" {
  description = "Enable Docker privileged mode"
  type        = bool
  default     = false
}

variable "source_type" {
  description = "Source type"
  type        = string
  default     = "GITHUB"
}

variable "source_location" {
  description = "Repository URL or S3 location"
  type        = string
}

variable "buildspec" {
  description = "Path to buildspec file"
  type        = string
  default     = "buildspec.yml"
}

variable "build_timeout" {
  description = "Timeout in minutes"
  type        = number
  default     = 60
}

variable "environment_variables" {
  description = "List of environment variables"
  type = list(object({
    name  = string
    value = string
    type  = optional(string, "PLAINTEXT")
  }))
  default = []
}

variable "tags" {
  description = "Tags for resources"
  type        = map(string)
  default     = {}
}
