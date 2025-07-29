resource "aws_iam_role" "codebuild_role" {
  name = "${var.name_prefix}-codebuild-role"
  assume_role_policy = data.aws_iam_policy_document.codebuild_assume_role.json
  tags = var.tags
}

data "aws_iam_policy_document" "codebuild_assume_role" {
  statement {
    effect = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["codebuild.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy_attachment" "codebuild_policy" {
  role       = aws_iam_role.codebuild_role.name
  policy_arn = "arn:aws:iam::aws:policy/AWSCodeBuildDeveloperAccess"
}

resource "aws_codebuild_project" "my_codebuild" {
  name          = "${var.name_prefix}-build"
  description   = "CodeBuild project for ${var.name_prefix}"
  service_role  = aws_iam_role.codebuild_role.arn
  build_timeout = var.build_timeout

  artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    compute_type                = var.compute_type
    image                       = var.image
    type                        = "LINUX_CONTAINER"
    privileged_mode             = var.privileged_mode
  }

  source {
    type      = var.source_type
    location  = var.source_location
    buildspec = var.buildspec
  }

  tags = var.tags
}
