variable "name_prefix" {
  description = "Prefix for resource names"
  type        = string
}

variable "codebuild_project_name" {
  description = "Name of the CodeBuild project"
  type        = string
}

variable "source_provider" {
  description = "Source provider"
  type        = string
  default     = "GitHub"
}

variable "repo_owner" {
  description = "Repository owner"
  type        = string
}

variable "repo_name" {
  description = "Repository name"
  type        = string
}

variable "repo_branch" {
  description = "Repository branch"
  type        = string
  default     = "main"
}

variable "github_oauth_token" {
  description = "GitHub OAuth token for webhook"
  type        = string
  sensitive   = true
}

variable "tags" {
  description = "Tags for resources"
  type        = map(string)
  default     = {}
}
