# CloudTrail S3 Data Events (Event Data Stores - Alternative Approach)
# Fixes findings: 3.1.5, 3.1.6
#
# NOTE: The primary remediation for findings 3.1.5 and 3.1.6 is in cloudtrail-enhancements.tf
# where data event selectors are added directly to the CloudTrail trail.
#
# Event Data Stores (this file) are a newer CloudTrail feature that provides:
# - Longer retention (up to 7 years)
# - Advanced querying capabilities
# - Separate from traditional CloudTrail trails
#
# However, Prowler checks for data event selectors on the trail itself, so the
# configuration in cloudtrail-enhancements.tf is the primary solution.
#
# These Event Data Stores can be used as an additional layer of logging if needed.

# CloudTrail data event selector for S3 write events (Event Data Store)
resource "aws_cloudtrail_event_data_store" "s3_write_events" {
  provider = aws.eu-west-1
  name     = "s3-write-events"

  advanced_event_selector {
    name = "S3WriteEvents"
    field_selector {
      field  = "eventCategory"
      equals = ["Data"]
    }
    field_selector {
      field  = "resources.type"
      equals = ["AWS::S3::Object"]
    }
    field_selector {
      field       = "eventName"
      starts_with = ["Put", "Delete"]
    }
  }
}

# CloudTrail data event selector for S3 read events (Event Data Store)
resource "aws_cloudtrail_event_data_store" "s3_read_events" {
  provider = aws.eu-west-1
  name     = "s3-read-events"

  advanced_event_selector {
    name = "S3ReadEvents"
    field_selector {
      field  = "eventCategory"
      equals = ["Data"]
    }
    field_selector {
      field  = "resources.type"
      equals = ["AWS::S3::Object"]
    }
    field_selector {
      field       = "eventName"
      starts_with = ["Get"]
    }
  }
}

