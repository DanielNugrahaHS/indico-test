output "codepipeline_name" {
  value = aws_codepipeline.my_codepipeline.name
}

output "artifact_bucket_name" {
  value = aws_s3_bucket.artifact_store.bucket
}
