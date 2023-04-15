output "bucket_name" {
  description = "Bucket name"
  value       = aws_s3_bucket.default.bucket
}

output "bucket_id" {
  description = "Bucket ID"
  value       = aws_s3_bucket.default.id
}

output "bucket_arn" {
  description = "Bucket ARN"
  value       = aws_s3_bucket.default.arn
}
