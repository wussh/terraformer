# Amazon Macie
# Fixes finding: 2.2.2 - Ensure all data in Amazon S3 has been discovered, classified, and secured
# Check: macie_is_enabled
# Risk Level: Low
# Category: Attack Surface → Storage

# Note: Macie is a regional service. The finding checks eu-west-1, so we enable it there.
# Macie can also be enabled in other regions if needed.

# ============================================================================
# Macie Account (eu-west-1) - Required by finding
# ============================================================================
resource "aws_macie2_account" "macie_eu_west_1" {
  provider = aws.eu-west-1
}

# ============================================================================
# Macie Account (ap-southeast-1) - Additional region
# ============================================================================
resource "aws_macie2_account" "macie_ap_southeast_1" {
  provider = aws.ap-southeast-1
}

# ============================================================================
# Macie Classification Job (eu-west-1)
# ============================================================================
# Classification job to discover and classify S3 data
# This job scans S3 buckets for sensitive data
resource "aws_macie2_classification_job" "s3_classification_eu_west_1" {
  provider  = aws.eu-west-1
  job_type  = "ONE_TIME"
  name      = "s3-classification-job-eu-west-1"

  s3_job_definition {
    bucket_definitions {
      account_id = data.aws_caller_identity.current.account_id
      buckets    = ["aws-config-delivery-448531339111"]
    }
  }

  depends_on = [aws_macie2_account.macie_eu_west_1]
}

# ============================================================================
# Macie Classification Job (ap-southeast-1)
# ============================================================================
resource "aws_macie2_classification_job" "s3_classification_ap_southeast_1" {
  provider  = aws.ap-southeast-1
  job_type  = "ONE_TIME"
  name      = "s3-classification-job-ap-southeast-1"

  s3_job_definition {
    bucket_definitions {
      account_id = data.aws_caller_identity.current.account_id
      buckets    = ["aws-cloudtrail-logs-448531339111-f2484876"]
    }
  }

  depends_on = [aws_macie2_account.macie_ap_southeast_1]
}

