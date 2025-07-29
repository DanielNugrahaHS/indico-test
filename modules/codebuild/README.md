# CodeBuild Module

This module provisions an AWS CodeBuild project and associated IAM Role.

## Outputs

- `codebuild_project_name`
- `codebuild_project_arn`

## Example

module "codebuild" {
  source = "../modules/codebuild"

  name_prefix      = "indico"
  source_type      = "GITHUB"
  source_location  = "https://github.com/indico/app.git"
  buildspec        = "buildspec.yml"
  privileged_mode  = true

  environment_variables = [
    {
      name  = "ENV"
      value = "dev"
    }
  ]

  tags = {
    Project = "Indico"
  }
}
