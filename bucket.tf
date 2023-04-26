resource "aws_s3_bucket" "default" {
  bucket        = module.this.id
  force_destroy = var.force_destroy

  tags = merge(
    module.this.tags,
    {
      "Name" = "${module.this.id}"
    },
  )
}
    
resource "aws_s3_bucket_versioning" "default" {
  count = var.versioning_enabled ? 1 : 0

  bucket = aws_s3_bucket.default.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "default" {
  count = var.sse_enabled ? 1 : 0

  bucket = aws_s3_bucket.default.bucket
  rule {
    bucket_key_enabled = var.bucket_key_enabled

    apply_server_side_encryption_by_default {
      sse_algorithm     = var.kms_master_key_arn == "" ? "AES256" : "aws:kms"
      kms_master_key_id = var.kms_master_key_arn
    }
  }
}

resource "aws_s3_bucket_public_access_block" "default" {
  bucket                  = aws_s3_bucket.default.id
  block_public_acls       = true
  block_public_policy     = var.block_public_policy
  ignore_public_acls      = true
  restrict_public_buckets = var.restrict_public_buckets
}

resource "aws_s3_bucket_ownership_controls" "default" {

  bucket = aws_s3_bucket.default.id

  rule {
    object_ownership = var.s3_object_ownership
  }
}
