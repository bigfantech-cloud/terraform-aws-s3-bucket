# Purpose:

Create S3 bucket.

## Variable Inputs:

#### REQUIRED:

```
- project_name  (ex: project name).
- environment   (ex: dev/prod) if applicable.
```

#### OPTIONAL:

```
versioning_enabled:
  Bucket Versioning Enabled or Disabled. Default = Disabled.

force_destroy:
  Delete all objects from the bucket so that the bucket can be destroyed without error (true or false). Default = false.

acl:
  Bucket ACL. Default = private.

block_public_acls:
  Whether Amazon S3 should block public ACLs for this bucket. Default = true.

block_public_policy:
  Whether Amazon S3 should block public bucket policies for this bucket. Default = true.

ignore_public_acls:
  Whether Amazon S3 should ignore public ACLs for this bucket. Default = true.

restrict_public_buckets:
  Whether Amazon S3 should restrict public bucket policies for this bucket. Default = true.

s3_object_ownership:
  S3 object ownership control: ObjectWriter, BucketOwnerPreferred, and BucketOwnerEnforced. Default = ObjectWriter.

bucket_key_enabled:
  Is bucket key enabled for Server Side Encryption. Default = false.

kms_master_key_arn:
  The AWS KMS master key ARN used for the `SSE-KMS` encryption.s
```

## Major resources created:

- S3 bucket

# Steps to create the resources

1. Call the module from your tf code.
2. Specifying Variable Inputs along the module call.

Example:

```
module "media_bucket" {
  source      = "app.terraform.io/bigfantech/s3-bucket/aws"
  version     = "1.0.0"

  project_name  = "abc"
  environment   = "dev"
  attributes    = ["media-files"]

  s3_object_ownership = "BucketOwnerEnforced"
}

```

3. Apply: From terminal run following commands.

```
terraform init
```

```
terraform plan
```

```
terraform apply
```

!! You have successfully created S3 bucket as per your specification !!

---

## OUTPUTS

```
bucket_name:
  Bucket name.

bucket_id:
  Bucket ID.

bucket_arn:
  Bucket ARN.
```
