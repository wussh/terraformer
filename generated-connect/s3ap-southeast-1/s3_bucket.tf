resource "aws_s3_bucket" "tfer--aws-cloudtrail-logs-448531339111-f2484876" {
  bucket        = "aws-cloudtrail-logs-448531339111-f2484876"
  force_destroy = "false"

  grant {
    id          = "475aac7b9634365d9721b95356bf651eee78023a36cf57ecd0cf2e5cff804c70"
    permissions = ["FULL_CONTROL"]
    type        = "CanonicalUser"
  }

  object_lock_enabled = "false"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": "s3:GetBucketAcl",
      "Condition": {
        "StringEquals": {
          "AWS:SourceArn": "arn:aws:cloudtrail:ap-southeast-1:448531339111:trail/management-events"
        }
      },
      "Effect": "Allow",
      "Principal": {
        "Service": "cloudtrail.amazonaws.com"
      },
      "Resource": "arn:aws:s3:::aws-cloudtrail-logs-448531339111-f2484876",
      "Sid": "AWSCloudTrailAclCheck20150319-69b288db-26bb-43be-a7ea-176cab697249"
    },
    {
      "Action": "s3:PutObject",
      "Condition": {
        "StringEquals": {
          "AWS:SourceArn": "arn:aws:cloudtrail:ap-southeast-1:448531339111:trail/management-events",
          "s3:x-amz-acl": "bucket-owner-full-control"
        }
      },
      "Effect": "Allow",
      "Principal": {
        "Service": "cloudtrail.amazonaws.com"
      },
      "Resource": "arn:aws:s3:::aws-cloudtrail-logs-448531339111-f2484876/AWSLogs/448531339111/*",
      "Sid": "AWSCloudTrailWrite20150319-bd907af0-6897-45c0-a0fa-5f4149a7671c"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  request_payer = "BucketOwner"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }

      bucket_key_enabled = "false"
    }
  }

  versioning {
    enabled    = "false"
    mfa_delete = "false"
  }
}
