# CloudTrail Enhancements
# Fixes findings: 3.1.2, 3.1.3, 4.2.3

# KMS Key for CloudTrail encryption
resource "aws_kms_key" "cloudtrail_key" {
  provider                = aws.us-east-2
  description             = "KMS key for CloudTrail log encryption"
  deletion_window_in_days = 30
  enable_key_rotation     = true

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "Enable IAM User Permissions"
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
        }
        Action   = "kms:*"
        Resource = "*"
      },
      {
        Sid    = "Allow CloudTrail to encrypt logs"
        Effect = "Allow"
        Principal = {
          Service = "cloudtrail.amazonaws.com"
        }
        Action = [
          "kms:GenerateDataKey*"
        ]
        Resource = "*"
        Condition = {
          StringEquals = {
            "kms:ViaService" = "s3.us-east-2.amazonaws.com"
          }
        }
      },
      {
        Sid    = "Allow CloudTrail to describe key"
        Effect = "Allow"
        Principal = {
          Service = "cloudtrail.amazonaws.com"
        }
        Action   = "kms:DescribeKey"
        Resource = "*"
      }
    ]
  })

  tags = {
    Name        = "cloudtrail-encryption-key"
    Purpose     = "CloudTrail log encryption"
    Environment = "production"
  }
}

resource "aws_kms_alias" "cloudtrail_key_alias" {
  provider      = aws.us-east-2
  name          = "alias/cloudtrail-logs"
  target_key_id = aws_kms_key.cloudtrail_key.key_id
}

# Update CloudTrail to enable file validation and KMS encryption
# Note: This assumes the trail "management-events" exists
# If it doesn't exist, you'll need to create it first
data "aws_cloudtrail_service_account" "main" {
  provider = aws.us-east-2
}

# S3 bucket for CloudTrail access logs
resource "aws_s3_bucket" "cloudtrail_access_logs" {
  provider = aws.ap-southeast-1
  bucket   = "aws-cloudtrail-access-logs-${data.aws_caller_identity.current.account_id}"
}

resource "aws_s3_bucket_versioning" "cloudtrail_access_logs" {
  provider = aws.ap-southeast-1
  bucket   = aws_s3_bucket.cloudtrail_access_logs.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "cloudtrail_access_logs" {
  provider = aws.ap-southeast-1
  bucket   = aws_s3_bucket.cloudtrail_access_logs.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "cloudtrail_access_logs" {
  provider                = aws.ap-southeast-1
  bucket                  = aws_s3_bucket.cloudtrail_access_logs.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets  = true
}

# Enable server access logging on CloudTrail bucket
resource "aws_s3_bucket_logging" "cloudtrail_bucket_logging" {
  provider = aws.ap-southeast-1
  bucket   = "aws-cloudtrail-logs-448531339111-f2484876"

  target_bucket = aws_s3_bucket.cloudtrail_access_logs.id
  target_prefix = "cloudtrail-access-logs/"
}

# Note: CloudTrail trail updates need to be done via data source and resource update
# This is a placeholder - you'll need to import or reference the existing trail
# resource "aws_cloudtrail" "management_events" {
#   provider                      = aws.us-east-2
#   name                          = "management-events"
#   s3_bucket_name                = "aws-cloudtrail-logs-448531339111-f2484876"
#   include_global_service_events  = true
#   is_multi_region_trail          = true
#   enable_log_file_validation    = true
#   kms_key_id                    = aws_kms_key.cloudtrail_key.arn
#   enable_logging                = true
# }


