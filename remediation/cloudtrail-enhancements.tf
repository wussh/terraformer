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
            "kms:ViaService" = [
              "s3.us-east-2.amazonaws.com",
              "s3.ap-southeast-1.amazonaws.com"
            ]
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

# CloudTrail Trail with Log File Validation, KMS Encryption, S3 Access Logging, and Data Events
# Finding 3.1.2: Ensure CloudTrail log file validation is enabled
# Finding 3.1.3: Ensure CloudTrail S3 bucket access logging is enabled
# Finding 3.1.5: Ensure object-level logging for write events is enabled for S3 buckets
# Finding 3.1.6: Ensure object-level logging for read events is enabled for S3 buckets
# Finding 4.2.3: Ensure CloudTrail logs are encrypted at rest using KMS CMKs
# Note: If the trail already exists, you need to import it first:
#   terraform import aws_cloudtrail.management_events management-events
resource "aws_cloudtrail" "management_events" {
  provider                      = aws.us-east-2
  name                          = "management-events"
  s3_bucket_name                = "aws-cloudtrail-logs-448531339111-f2484876"
  include_global_service_events  = true
  is_multi_region_trail          = true
  enable_log_file_validation     = true  # 3.1.2: Log file validation enabled
  kms_key_id                     = aws_kms_key.cloudtrail_key.arn  # 4.2.3: KMS encryption
  enable_logging                 = true

  # 3.1.5: S3 data event logging for write operations (Put, Delete, etc.)
  event_selector {
    read_write_type                 = "WriteOnly"
    include_management_events       = false

    data_resource {
      type   = "AWS::S3::Object"
      values = ["arn:aws:s3:::*/*"]  # All S3 buckets and objects
    }
  }

  # 3.1.6: S3 data event logging for read operations (Get, Head, etc.)
  event_selector {
    read_write_type                 = "ReadOnly"
    include_management_events       = false

    data_resource {
      type   = "AWS::S3::Object"
      values = ["arn:aws:s3:::*/*"]  # All S3 buckets and objects
    }
  }

  depends_on = [
    aws_kms_key.cloudtrail_key,
    aws_kms_alias.cloudtrail_key_alias
  ]
}


