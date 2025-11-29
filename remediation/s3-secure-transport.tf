# S3 Secure Transport Policy
# Fixes finding: 4.1.1

# Get the existing CloudTrail bucket
data "aws_s3_bucket" "cloudtrail_logs" {
  provider = aws.ap-southeast-1
  bucket   = "aws-cloudtrail-logs-448531339111-f2484876"
}

# Add secure transport policy to CloudTrail bucket
resource "aws_s3_bucket_policy" "cloudtrail_secure_transport" {
  provider = aws.ap-southeast-1
  bucket   = data.aws_s3_bucket.cloudtrail_logs.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "DenyInsecureConnections"
        Effect = "Deny"
        Principal = "*"
        Action   = "s3:*"
        Resource = [
          "${data.aws_s3_bucket.cloudtrail_logs.arn}",
          "${data.aws_s3_bucket.cloudtrail_logs.arn}/*"
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

