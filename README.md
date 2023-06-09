# Purpose:

Create S3 bucket.

## Variable Inputs:

#### REQUIRED:

```
- project_name
- environment
```

#### OPTIONAL:

```
versioning_enabled:
  Bucket Versioning Enabled or Disabled. Default = Disabled.

force_destroy:
  Delete all objects from the bucket so that the bucket can be destroyed without error (true or false). Default = false.

block_public_policy:
  Whether Amazon S3 should block public bucket policies for this bucket. Default = true.

restrict_public_buckets:
  Whether Amazon S3 should restrict public bucket policies for this bucket. Default = true.

s3_object_ownership:
  S3 object ownership control: ObjectWriter, BucketOwnerPreferred, and BucketOwnerEnforced. Default = BucketOwnerEnforced.

bucket_key_enabled:
  Is bucket key enabled for Server Side Encryption. Default = false.

kms_master_key_arn:
  The AWS KMS master key ARN used for the `SSE-KMS` encryption.

bucket_policy_documents_list
  List of IAM policy documents
```

## Major resources created:

- S3 bucket

# Steps to create the resources

1. Call the module from your tf code.
2. Specifying Variable Inputs along the module call.

Example:

```
module "media_bucket" {
  source      = "bigfantech-cloud/s3-bucket/aws"
  version     = "" # find the latest version from https://registry.terraform.io/modules/bigfantech-cloud/s3-bucket/aws/latest

  project_name  = "abc"
  environment   = "dev"
  attributes    = ["media-files"]
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
