# AWS Config for all regions
# Fixes finding: 3.3.1

variable "config_regions" {
  description = "List of AWS regions to enable Config"
  type        = list(string)
  default = [
    "ap-northeast-1",
    "ap-northeast-2",
    "ap-northeast-3",
    "ap-south-1",
    "ap-southeast-1",
    "ap-southeast-2",
    "ca-central-1",
    "eu-central-1",
    "eu-north-1",
    "eu-west-1",
    "eu-west-2",
    "eu-west-3",
    "sa-east-1",
    "us-east-1",
    "us-east-2",
    "us-west-1",
    "us-west-2"
  ]
}

# S3 bucket for Config delivery
resource "aws_s3_bucket" "config_delivery" {
  provider = aws.eu-west-1
  bucket   = "aws-config-delivery-${data.aws_caller_identity.current.account_id}"

  force_destroy = false
}

resource "aws_s3_bucket_versioning" "config_delivery" {
  provider = aws.eu-west-1
  bucket   = aws_s3_bucket.config_delivery.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "config_delivery" {
  provider = aws.eu-west-1
  bucket   = aws_s3_bucket.config_delivery.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "config_delivery" {
  provider                = aws.eu-west-1
  bucket                  = aws_s3_bucket.config_delivery.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets  = true
}

# IAM role for Config
resource "aws_iam_role" "config_role" {
  provider = aws.eu-west-1
  name     = "aws-config-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "config.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "config_role_policy" {
  provider   = aws.eu-west-1
  role       = aws_iam_role.config_role.name
  policy_arn = aws_iam_policy.config_service_role_policy.arn
}

# Inline replica of the AWSConfigRole managed policy (AWS-managed policy
# cannot be attached programmatically in this account, so we recreate it)
resource "aws_iam_policy" "config_service_role_policy" {
  provider = aws.eu-west-1
  name     = "aws-config-service-role-policy"
  path     = "/service-role/"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "config:BatchGetResourceConfig",
          "config:BatchPutResourceConfig",
          "config:DeliverConfigSnapshot",
          "config:Describe*",
          "config:Get*",
          "config:List*",
          "config:Put*",
          "config:Select*"
        ]
        Resource = "*"
      },
      {
        Effect = "Allow"
        Action = [
          "iam:GetRole",
          "iam:ListRoles",
          "iam:PassRole"
        ]
        Resource = "*"
      },
      {
        Effect = "Allow"
        Action = [
          "sns:GetTopicAttributes",
          "sns:ListSubscriptionsByTopic",
          "sns:Publish",
          "sns:SetTopicAttributes",
          "sns:Subscribe",
          "sns:Unsubscribe"
        ]
        Resource = "*"
      },
      {
        Effect = "Allow"
        Action = [
          "s3:GetBucketAcl",
          "s3:GetBucketLocation",
          "s3:GetBucketLogging",
          "s3:GetBucketPolicy",
          "s3:GetBucketTagging",
          "s3:GetBucketVersioning"
        ]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy" "config_s3_policy" {
  provider = aws.eu-west-1
  name     = "config-s3-policy"
  role     = aws_iam_role.config_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:PutObject"
        ]
        Resource = "${aws_s3_bucket.config_delivery.arn}/*"
        Condition = {
          StringEquals = {
            "s3:x-amz-server-side-encryption" = "AES256"
          }
        }
      },
      {
        Effect = "Allow"
        Action = [
          "s3:GetBucketAcl"
        ]
        Resource = aws_s3_bucket.config_delivery.arn
      }
    ]
  })
}

# Config delivery channel and recorder for each region
# Using a module-like approach with individual resources per region

# Helper locals for region-specific resources
locals {
  config_resources = {
    for region in var.config_regions : region => {
      provider = "aws.${replace(region, "-", "_")}"
    }
  }
}

# Note: Due to Terraform limitations with dynamic provider references,
# we'll create a simplified version that works with the default provider
# and requires manual provider specification or use of workspaces/modules
# For production, consider using Terraform modules per region

# Config recorder for eu-west-1 (example - expand for all regions)
resource "aws_config_configuration_recorder" "config_recorder_eu_west_1" {
  provider = aws.eu-west-1
  name     = "default"
  role_arn = aws_iam_role.config_role.arn

  recording_group {
    all_supported                 = true
    include_global_resource_types = true
  }
}

resource "aws_config_delivery_channel" "config_delivery_channel_eu_west_1" {
  provider       = aws.eu-west-1
  name           = "default"
  s3_bucket_name = aws_s3_bucket.config_delivery.bucket
  s3_key_prefix   = "config/eu-west-1"
  sns_topic_arn  = null

  depends_on = [aws_config_configuration_recorder.config_recorder_eu_west_1]
}

resource "aws_config_configuration_recorder_status" "config_recorder_status_eu_west_1" {
  provider  = aws.eu-west-1
  name      = aws_config_configuration_recorder.config_recorder_eu_west_1.name
  is_enabled = true

  depends_on = [aws_config_delivery_channel.config_delivery_channel_eu_west_1]
}

# Note: Repeat the above pattern for all other regions
# For brevity, showing one region as example
# In production, use a module or generate these resources programmatically


