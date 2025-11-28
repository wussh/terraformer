resource "aws_cloudtrail" "tfer--management-events" {
  advanced_event_selector {
    field_selector {
      equals = ["Management"]
      field  = "eventCategory"
    }

    name = "Management events selector"
  }

  enable_log_file_validation    = "false"
  enable_logging                = "true"
  include_global_service_events = "true"
  is_multi_region_trail         = "true"
  is_organization_trail         = "false"
  name                          = "management-events"
  s3_bucket_name                = "aws-cloudtrail-logs-448531339111-f2484876"
}
