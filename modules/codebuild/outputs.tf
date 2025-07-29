output "codebuild_project_name" {
  value = aws_codebuild_project.my_codebuild.name
}

output "codebuild_project_arn" {
  value = aws_codebuild_project.my_codebuild.arn
}
