# S3 Secure Transport Policy
# Fixes finding: 4.1.1 - S3 Bucket Does Not Deny Insecure (HTTP) Requests
# Check: s3_bucket_secure_transport_policy
# Risk Level: Medium
# Category: Encryption → In-Transit

# This policy denies all HTTP (unencrypted) requests to S3 buckets
# Only HTTPS requests are allowed, ensuring data encryption in transit

# ============================================================================
# Bucket 1: CloudTrail Access Logs (ap-southeast-1)
# ============================================================================
resource "aws_s3_bucket_policy" "cloudtrail_access_logs_secure_transport" {
  provider = aws.ap-southeast-1
  bucket   = "aws-cloudtrail-access-logs-448531339111"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "DenyInsecureTransport"
        Effect = "Deny"
        Principal = "*"
        Action   = "s3:*"
        Resource = [
          "arn:aws:s3:::aws-cloudtrail-access-logs-448531339111",
          "arn:aws:s3:::aws-cloudtrail-access-logs-448531339111/*"
        ]
        Condition = {
          Bool = {
            "aws:SecureTransport" = "false"
          }
        }
      }
    ]
  })
}

# ============================================================================
# Bucket 2: AWS Config Delivery (eu-west-1)
# ============================================================================
resource "aws_s3_bucket_policy" "config_delivery_secure_transport" {
  provider = aws.eu-west-1
  bucket   = "aws-config-delivery-448531339111"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "DenyInsecureTransport"
        Effect = "Deny"
        Principal = "*"
        Action   = "s3:*"
        Resource = [
          "arn:aws:s3:::aws-config-delivery-448531339111",
          "arn:aws:s3:::aws-config-delivery-448531339111/*"
        ]
        Condition = {
          Bool = {
            "aws:SecureTransport" = "false"
          }
        }
      }
    ]
  })
}

# ============================================================================
# Bucket 3: CloudTrail Logs (ap-southeast-1) - Already existed
# ============================================================================
resource "aws_s3_bucket_policy" "cloudtrail_secure_transport" {
  provider = aws.ap-southeast-1
  bucket   = "aws-cloudtrail-logs-448531339111-f2484876"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "DenyInsecureTransport"
        Effect = "Deny"
        Principal = "*"
        Action   = "s3:*"
        Resource = [
          "arn:aws:s3:::aws-cloudtrail-logs-448531339111-f2484876",
          "arn:aws:s3:::aws-cloudtrail-logs-448531339111-f2484876/*"
        ]
        Condition = {
          Bool = {
            "aws:SecureTransport" = "false"
          }
        }
      }
    ]
  })
}

