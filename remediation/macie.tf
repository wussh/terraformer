# Amazon Macie
# Fixes finding: 2.2.2

resource "aws_macie2_account" "macie" {
  provider = aws.ap-southeast-1
}

# Macie classification job for S3 buckets
resource "aws_macie2_classification_job" "s3_classification" {
  provider = aws.ap-southeast-1
  job_type  = "ONE_TIME"
  name      = "s3-classification-job"

  s3_job_definition {
    bucket_definitions {
      account_id = data.aws_caller_identity.current.account_id
      buckets    = ["aws-cloudtrail-logs-448531339111-f2484876"]
    }
  }

  depends_on = [aws_macie2_account.macie]
}

