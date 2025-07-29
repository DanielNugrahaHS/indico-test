# CodePipeline Module

This module provisions a CodePipeline integrated with GitHub and CodeBuild.

## Outputs

- `codepipeline_name`
- `artifact_bucket_name`

## Example
module "codepipeline" {
  source = "../modules/codepipeline"

  name_prefix             = "indico"
  codebuild_project_name = module.codebuild.codebuild_project_name

  repo_owner         = "indico-org"
  repo_name          = "app-repo"
  github_oauth_token = var.github_token

  tags = {
    Project = "Indico"
    Env     = "dev"
  }
}
