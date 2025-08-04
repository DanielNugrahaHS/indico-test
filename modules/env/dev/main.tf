provider "aws" {
  region = "us-east-1"
}

variable "github_token" {
  description = "GitHub personal access token"
  type        = string
  sensitive   = true
}

locals {
  name_prefix = "indico-dev"
  tags = {
    Project = "Indico"
  }
}

# For ALB
module "alb" {
  source = "../../modules/alb"

  name_prefix       = local.name_prefix
  subnet_ids        = ["subnet-xxxxxxxx", "subnet-yyyyyyyy"]
  vpc_id            = "vpc-zzzzzzzz"
  health_check_path = "/"
  tags              = local.tags
}

# For ECS
module "ecs" {
  source = "../../modules/ecs"

  name_prefix               = local.name_prefix
  cluster_name              = "${local.name_prefix}-cluster"
  cpu                       = "256"
  memory                    = "512"
  container_definitions_json = file("${path.module}/container_definitions.json")
  subnet_ids                = ["subnet-xxxxxxxx", "subnet-yyyyyyyy"]
  vpc_id                    = "vpc-zzzzzzzz"
  assign_public_ip          = true
  desired_count             = 2
  container_port            = 80
  tags                      = local.tags
}

# For CodeBuild
module "codebuild" {
  source = "../../modules/codebuild"

  name_prefix            = local.name_prefix
  source_type            = "GITHUB"
  source_location        = "https://github.com/YOUR_GITHUB_ORG/YOUR_REPO_NAME"
  buildspec              = "buildspec.yml"
  privileged_mode        = true

  environment_variables = [
    {
      name  = "ENV"
    }
  ]

  tags = local.tags
}

# For CodePipeline
module "codepipeline" {
  source = "../../modules/codepipeline"

  name_prefix             = local.name_prefix
  codebuild_project_name  = module.codebuild.codebuild_project_name

  source_provider    = "GitHub"
  repo_owner         = "YOUR_GITHUB_ORG"
  repo_name          = "YOUR_REPO_NAME"
  repo_branch        = "main"
  github_oauth_token = var.github_token

  tags = local.tags
}
