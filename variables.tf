variable "force_destroy" {
  description = "Delete all objects from the bucket so that the bucket can be destroyed without error (true or false). Default = false"
  type        = bool
  default     = false
}

variable "block_public_policy" {
  description = "Whether Amazon S3 should block public bucket policies for this bucket. Default = true"
  default     = true
}

variable "restrict_public_buckets" {
  description = "Whether Amazon S3 should restrict public bucket policies for this bucket. Default = true"
  default     = true
}

variable "s3_object_ownership" {
  description = "S3 object ownership control: ObjectWriter, BucketOwnerPreferred, and BucketOwnerEnforced. Default = BucketOwnerEnforced"
  type        = string
  default     = "BucketOwnerEnforced"
}

variable "versioning_enabled" {
  description = "Bucket Versioning Enabled or Disabled. Default = false"
  type        = bool
  default     = false
}

variable "sse_enabled" {
  description = "Bucket Server Side Encryption Enabled or Disabled. Default = true"
  type        = bool
  default     = true
}

variable "bucket_key_enabled" {
  description = "Is bucket key enabled for Server Side Encryption"
  type        = bool
  default     = false
}

variable "kms_master_key_arn" {
  description = "The AWS KMS master key ARN used for the `SSE-KMS` encryption. Specify the kms_master_key_arn only if sse_algorithm = aws:kms."
  type        = string
  default     = ""
}
