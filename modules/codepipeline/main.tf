resource "aws_s3_bucket" "artifact_store" {
  bucket = "${var.name_prefix}-pipeline-artifacts"
  force_destroy = true
  tags = var.tags
}

resource "aws_iam_role" "codepipeline_role" {
  name = "${var.name_prefix}-pipeline-role"
  assume_role_policy = data.aws_iam_policy_document.codepipeline_assume_role.json
  tags = var.tags
}

data "aws_iam_policy_document" "codepipeline_assume_role" {
  statement {
    effect = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["codepipeline.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy_attachment" "codepipeline_policy" {
  role       = aws_iam_role.codepipeline_role.name
  policy_arn = "arn:aws:iam::aws:policy/AWSCodePipelineFullAccess"
}

resource "aws_codepipeline" "my_codepipeline" {
  name     = "${var.name_prefix}-pipeline"
  role_arn = aws_iam_role.codepipeline_role.arn

  artifact_store {
    location = aws_s3_bucket.artifact_store.bucket
    type     = "S3"
  }

  stage {
    name = "Source"

    action {
      name             = "Source"
      category         = "Source"
      owner            = "ThirdParty"
      provider         = var.source_provider
      version          = "1"
      output_artifacts = ["source_output"]

      configuration = {
        Owner  = var.repo_owner
        Repo   = var.repo_name
        Branch = var.repo_branch
        OAuthToken = var.github_oauth_token
      }
    }
  }

  stage {
    name = "Build"

    action {
      name             = "Build"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      version          = "1"
      input_artifacts  = ["source_output"]
      output_artifacts = ["build_output"]

      configuration = {
        ProjectName = var.codebuild_project_name
      }
    }
  }

  tags = var.tags
}
