# CloudTrail S3 Data Events
# Fixes findings: 3.1.5, 3.1.6

# CloudTrail data event selector for S3 write events
# Note: This creates event data stores that will capture S3 data events
# The event selectors are configured to match all S3 buckets in the account
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

# CloudTrail data event selector for S3 read events
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

# Note: For existing CloudTrail trails, you would need to add data event selectors
# This is a more modern approach using Event Data Stores
# For traditional trails, you would use aws_cloudtrail_event_selector resources

