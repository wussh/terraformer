# CloudWatch Metric Filters and Alarms
# Fixes findings: 3.3.2 through 3.3.16

# CloudWatch Log Group for CloudTrail
# Note: Adjust the log group name based on your CloudTrail configuration
# Common names: CloudTrail/DefaultLogGroup, CloudTrailLogs, or custom names
resource "aws_cloudwatch_log_group" "cloudtrail" {
  provider          = aws.eu-west-1
  name              = "CloudTrail/DefaultLogGroup"
  retention_in_days = 365

  kms_key_id = null # Can be set to a KMS key ARN for encryption
}

# SNS Topic for alarms
resource "aws_sns_topic" "security_alerts" {
  provider = aws.eu-west-1
  name     = "security-compliance-alerts"
}

# 3.3.2: Unauthorized API calls
resource "aws_cloudwatch_log_metric_filter" "unauthorized_api_calls" {
  provider   = aws.eu-west-1
  name       = "UnauthorizedAPICalls"
  log_group_name = aws_cloudwatch_log_group.cloudtrail.name
  pattern    = "{ ($.errorCode = \"*UnauthorizedOperation\") || ($.errorCode = \"AccessDenied*\") }"

  metric_transformation {
    name      = "UnauthorizedAPICalls"
    namespace = "CloudTrailMetrics"
    value     = "1"
  }
}

resource "aws_cloudwatch_metric_alarm" "unauthorized_api_calls" {
  provider            = aws.eu-west-1
  alarm_name          = "UnauthorizedAPICalls"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "UnauthorizedAPICalls"
  namespace           = "CloudTrailMetrics"
  period              = "300"
  statistic           = "Sum"
  threshold           = "0"
  alarm_description   = "Monitor for unauthorized API calls"
  alarm_actions       = [aws_sns_topic.security_alerts.arn]
}

# 3.3.3: Console sign-in without MFA
resource "aws_cloudwatch_log_metric_filter" "sign_in_without_mfa" {
  provider   = aws.eu-west-1
  name       = "ConsoleSignInWithoutMFA"
  log_group_name = aws_cloudwatch_log_group.cloudtrail.name
  pattern    = "{ ($.eventName = \"ConsoleLogin\") && ($.additionalEventData.MFAUsed != \"Yes\") }"

  metric_transformation {
    name      = "ConsoleSignInWithoutMFA"
    namespace = "CloudTrailMetrics"
    value     = "1"
  }
}

resource "aws_cloudwatch_metric_alarm" "sign_in_without_mfa" {
  provider            = aws.eu-west-1
  alarm_name          = "ConsoleSignInWithoutMFA"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "ConsoleSignInWithoutMFA"
  namespace           = "CloudTrailMetrics"
  period              = "300"
  statistic           = "Sum"
  threshold           = "0"
  alarm_description   = "Monitor for console sign-ins without MFA"
  alarm_actions       = [aws_sns_topic.security_alerts.arn]
}

# 3.3.4: Root account usage
resource "aws_cloudwatch_log_metric_filter" "root_usage" {
  provider   = aws.eu-west-1
  name       = "RootAccountUsage"
  log_group_name = aws_cloudwatch_log_group.cloudtrail.name
  pattern    = "{ $.userIdentity.type = \"Root\" && $.userIdentity.invokedBy NOT EXISTS && $.eventType != \"AwsServiceEvent\" }"

  metric_transformation {
    name      = "RootAccountUsage"
    namespace = "CloudTrailMetrics"
    value     = "1"
  }
}

resource "aws_cloudwatch_metric_alarm" "root_usage" {
  provider            = aws.eu-west-1
  alarm_name          = "RootAccountUsage"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "RootAccountUsage"
  namespace           = "CloudTrailMetrics"
  period              = "300"
  statistic           = "Sum"
  threshold           = "0"
  alarm_description   = "Monitor for root account usage"
  alarm_actions       = [aws_sns_topic.security_alerts.arn]
}

# 3.3.5: IAM policy changes
resource "aws_cloudwatch_log_metric_filter" "iam_policy_changes" {
  provider   = aws.eu-west-1
  name       = "IAMPolicyChanges"
  log_group_name = aws_cloudwatch_log_group.cloudtrail.name
  pattern    = "{ ($.eventName = \"DeleteGroupPolicy\") || ($.eventName = \"DeleteRolePolicy\") || ($.eventName = \"DeleteUserPolicy\") || ($.eventName = \"PutGroupPolicy\") || ($.eventName = \"PutRolePolicy\") || ($.eventName = \"PutUserPolicy\") || ($.eventName = \"CreatePolicy\") || ($.eventName = \"DeletePolicy\") || ($.eventName = \"CreatePolicyVersion\") || ($.eventName = \"DeletePolicyVersion\") || ($.eventName = \"AttachRolePolicy\") || ($.eventName = \"DetachRolePolicy\") || ($.eventName = \"AttachUserPolicy\") || ($.eventName = \"DetachUserPolicy\") || ($.eventName = \"AttachGroupPolicy\") || ($.eventName = \"DetachGroupPolicy\") }"

  metric_transformation {
    name      = "IAMPolicyChanges"
    namespace = "CloudTrailMetrics"
    value     = "1"
  }
}

resource "aws_cloudwatch_metric_alarm" "iam_policy_changes" {
  provider            = aws.eu-west-1
  alarm_name          = "IAMPolicyChanges"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "IAMPolicyChanges"
  namespace           = "CloudTrailMetrics"
  period              = "300"
  statistic           = "Sum"
  threshold           = "0"
  alarm_description   = "Monitor for IAM policy changes"
  alarm_actions       = [aws_sns_topic.security_alerts.arn]
}

# 3.3.6: CloudTrail configuration changes
resource "aws_cloudwatch_log_metric_filter" "cloudtrail_config_changes" {
  provider   = aws.eu-west-1
  name       = "CloudTrailConfigChanges"
  log_group_name = aws_cloudwatch_log_group.cloudtrail.name
  pattern    = "{ ($.eventName = \"CreateTrail\") || ($.eventName = \"UpdateTrail\") || ($.eventName = \"DeleteTrail\") || ($.eventName = \"StartLogging\") || ($.eventName = \"StopLogging\") }"

  metric_transformation {
    name      = "CloudTrailConfigChanges"
    namespace = "CloudTrailMetrics"
    value     = "1"
  }
}

resource "aws_cloudwatch_metric_alarm" "cloudtrail_config_changes" {
  provider            = aws.eu-west-1
  alarm_name          = "CloudTrailConfigChanges"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "CloudTrailConfigChanges"
  namespace           = "CloudTrailMetrics"
  period              = "300"
  statistic           = "Sum"
  threshold           = "0"
  alarm_description   = "Monitor for CloudTrail configuration changes"
  alarm_actions       = [aws_sns_topic.security_alerts.arn]
}

# 3.3.7: Console authentication failures
resource "aws_cloudwatch_log_metric_filter" "authentication_failures" {
  provider   = aws.eu-west-1
  name       = "ConsoleAuthenticationFailures"
  log_group_name = aws_cloudwatch_log_group.cloudtrail.name
  pattern    = "{ ($.eventName = \"ConsoleLogin\") && ($.errorMessage = \"Failed authentication\") }"

  metric_transformation {
    name      = "ConsoleAuthenticationFailures"
    namespace = "CloudTrailMetrics"
    value     = "1"
  }
}

resource "aws_cloudwatch_metric_alarm" "authentication_failures" {
  provider            = aws.eu-west-1
  alarm_name          = "ConsoleAuthenticationFailures"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "ConsoleAuthenticationFailures"
  namespace           = "CloudTrailMetrics"
  period              = "300"
  statistic           = "Sum"
  threshold           = "5"
  alarm_description   = "Monitor for console authentication failures"
  alarm_actions       = [aws_sns_topic.security_alerts.arn]
}

# 3.3.8: KMS CMK disable/deletion
resource "aws_cloudwatch_log_metric_filter" "kms_cmk_changes" {
  provider   = aws.eu-west-1
  name       = "KMSCMKChanges"
  log_group_name = aws_cloudwatch_log_group.cloudtrail.name
  pattern    = "{ ($.eventName = \"DisableKey\") || ($.eventName = \"ScheduleKeyDeletion\") }"

  metric_transformation {
    name      = "KMSCMKChanges"
    namespace = "CloudTrailMetrics"
    value     = "1"
  }
}

resource "aws_cloudwatch_metric_alarm" "kms_cmk_changes" {
  provider            = aws.eu-west-1
  alarm_name          = "KMSCMKChanges"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "KMSCMKChanges"
  namespace           = "CloudTrailMetrics"
  period              = "300"
  statistic           = "Sum"
  threshold           = "0"
  alarm_description   = "Monitor for KMS CMK disable or deletion"
  alarm_actions       = [aws_sns_topic.security_alerts.arn]
}

# 3.3.9: S3 bucket policy changes
resource "aws_cloudwatch_log_metric_filter" "s3_bucket_policy_changes" {
  provider   = aws.eu-west-1
  name       = "S3BucketPolicyChanges"
  log_group_name = aws_cloudwatch_log_group.cloudtrail.name
  pattern    = "{ ($.eventName = \"PutBucketPolicy\") || ($.eventName = \"DeleteBucketPolicy\") }"

  metric_transformation {
    name      = "S3BucketPolicyChanges"
    namespace = "CloudTrailMetrics"
    value     = "1"
  }
}

resource "aws_cloudwatch_metric_alarm" "s3_bucket_policy_changes" {
  provider            = aws.eu-west-1
  alarm_name          = "S3BucketPolicyChanges"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "S3BucketPolicyChanges"
  namespace           = "CloudTrailMetrics"
  period              = "300"
  statistic           = "Sum"
  threshold           = "0"
  alarm_description   = "Monitor for S3 bucket policy changes"
  alarm_actions       = [aws_sns_topic.security_alerts.arn]
}

# 3.3.10: AWS Config configuration changes
resource "aws_cloudwatch_log_metric_filter" "config_changes" {
  provider   = aws.eu-west-1
  name       = "AWSConfigChanges"
  log_group_name = aws_cloudwatch_log_group.cloudtrail.name
  pattern    = "{ ($.eventName = \"PutConfigurationRecorder\") || ($.eventName = \"PutDeliveryChannel\") || ($.eventName = \"DeleteConfigurationRecorder\") || ($.eventName = \"DeleteDeliveryChannel\") || ($.eventName = \"StartConfigurationRecorder\") || ($.eventName = \"StopConfigurationRecorder\") }"

  metric_transformation {
    name      = "AWSConfigChanges"
    namespace = "CloudTrailMetrics"
    value     = "1"
  }
}

resource "aws_cloudwatch_metric_alarm" "config_changes" {
  provider            = aws.eu-west-1
  alarm_name          = "AWSConfigChanges"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "AWSConfigChanges"
  namespace           = "CloudTrailMetrics"
  period              = "300"
  statistic           = "Sum"
  threshold           = "0"
  alarm_description   = "Monitor for AWS Config configuration changes"
  alarm_actions       = [aws_sns_topic.security_alerts.arn]
}

# 3.3.11: Security group changes
resource "aws_cloudwatch_log_metric_filter" "security_group_changes" {
  provider   = aws.eu-west-1
  name       = "SecurityGroupChanges"
  log_group_name = aws_cloudwatch_log_group.cloudtrail.name
  pattern    = "{ ($.eventName = \"AuthorizeSecurityGroupIngress\") || ($.eventName = \"AuthorizeSecurityGroupEgress\") || ($.eventName = \"RevokeSecurityGroupIngress\") || ($.eventName = \"RevokeSecurityGroupEgress\") || ($.eventName = \"CreateSecurityGroup\") || ($.eventName = \"DeleteSecurityGroup\") }"

  metric_transformation {
    name      = "SecurityGroupChanges"
    namespace = "CloudTrailMetrics"
    value     = "1"
  }
}

resource "aws_cloudwatch_metric_alarm" "security_group_changes" {
  provider            = aws.eu-west-1
  alarm_name          = "SecurityGroupChanges"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "SecurityGroupChanges"
  namespace           = "CloudTrailMetrics"
  period              = "300"
  statistic           = "Sum"
  threshold           = "0"
  alarm_description   = "Monitor for security group changes"
  alarm_actions       = [aws_sns_topic.security_alerts.arn]
}

# 3.3.12: NACL changes
resource "aws_cloudwatch_log_metric_filter" "nacl_changes" {
  provider   = aws.eu-west-1
  name       = "NACLChanges"
  log_group_name = aws_cloudwatch_log_group.cloudtrail.name
  pattern    = "{ ($.eventName = \"CreateNetworkAcl\") || ($.eventName = \"CreateNetworkAclEntry\") || ($.eventName = \"DeleteNetworkAcl\") || ($.eventName = \"DeleteNetworkAclEntry\") || ($.eventName = \"ReplaceNetworkAclEntry\") || ($.eventName = \"ReplaceNetworkAclAssociation\") }"

  metric_transformation {
    name      = "NACLChanges"
    namespace = "CloudTrailMetrics"
    value     = "1"
  }
}

resource "aws_cloudwatch_metric_alarm" "nacl_changes" {
  provider            = aws.eu-west-1
  alarm_name          = "NACLChanges"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "NACLChanges"
  namespace           = "CloudTrailMetrics"
  period              = "300"
  statistic           = "Sum"
  threshold           = "0"
  alarm_description   = "Monitor for NACL changes"
  alarm_actions       = [aws_sns_topic.security_alerts.arn]
}

# 3.3.13: Network gateway changes
resource "aws_cloudwatch_log_metric_filter" "network_gateway_changes" {
  provider   = aws.eu-west-1
  name       = "NetworkGatewayChanges"
  log_group_name = aws_cloudwatch_log_group.cloudtrail.name
  pattern    = "{ ($.eventName = \"CreateCustomerGateway\") || ($.eventName = \"DeleteCustomerGateway\") || ($.eventName = \"AttachInternetGateway\") || ($.eventName = \"CreateInternetGateway\") || ($.eventName = \"DeleteInternetGateway\") || ($.eventName = \"DetachInternetGateway\") }"

  metric_transformation {
    name      = "NetworkGatewayChanges"
    namespace = "CloudTrailMetrics"
    value     = "1"
  }
}

resource "aws_cloudwatch_metric_alarm" "network_gateway_changes" {
  provider            = aws.eu-west-1
  alarm_name          = "NetworkGatewayChanges"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "NetworkGatewayChanges"
  namespace           = "CloudTrailMetrics"
  period              = "300"
  statistic           = "Sum"
  threshold           = "0"
  alarm_description   = "Monitor for network gateway changes"
  alarm_actions       = [aws_sns_topic.security_alerts.arn]
}

# 3.3.14: Route table changes
resource "aws_cloudwatch_log_metric_filter" "route_table_changes" {
  provider   = aws.eu-west-1
  name       = "RouteTableChanges"
  log_group_name = aws_cloudwatch_log_group.cloudtrail.name
  pattern    = "{ ($.eventName = \"CreateRoute\") || ($.eventName = \"CreateRouteTable\") || ($.eventName = \"ReplaceRoute\") || ($.eventName = \"ReplaceRouteTableAssociation\") || ($.eventName = \"DeleteRouteTable\") || ($.eventName = \"DeleteRoute\") || ($.eventName = \"DisassociateRouteTable\") }"

  metric_transformation {
    name      = "RouteTableChanges"
    namespace = "CloudTrailMetrics"
    value     = "1"
  }
}

resource "aws_cloudwatch_metric_alarm" "route_table_changes" {
  provider            = aws.eu-west-1
  alarm_name          = "RouteTableChanges"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "RouteTableChanges"
  namespace           = "CloudTrailMetrics"
  period              = "300"
  statistic           = "Sum"
  threshold           = "0"
  alarm_description   = "Monitor for route table changes"
  alarm_actions       = [aws_sns_topic.security_alerts.arn]
}

# 3.3.15: VPC changes
resource "aws_cloudwatch_log_metric_filter" "vpc_changes" {
  provider   = aws.eu-west-1
  name       = "VPCChanges"
  log_group_name = aws_cloudwatch_log_group.cloudtrail.name
  pattern    = "{ ($.eventName = \"CreateVpc\") || ($.eventName = \"DeleteVpc\") || ($.eventName = \"ModifyVpcAttribute\") || ($.eventName = \"AcceptVpcPeeringConnection\") || ($.eventName = \"CreateVpcPeeringConnection\") || ($.eventName = \"DeleteVpcPeeringConnection\") || ($.eventName = \"RejectVpcPeeringConnection\") }"

  metric_transformation {
    name      = "VPCChanges"
    namespace = "CloudTrailMetrics"
    value     = "1"
  }
}

resource "aws_cloudwatch_metric_alarm" "vpc_changes" {
  provider            = aws.eu-west-1
  alarm_name          = "VPCChanges"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "VPCChanges"
  namespace           = "CloudTrailMetrics"
  period              = "300"
  statistic           = "Sum"
  threshold           = "0"
  alarm_description   = "Monitor for VPC changes"
  alarm_actions       = [aws_sns_topic.security_alerts.arn]
}

# 3.3.16: AWS Organizations changes
resource "aws_cloudwatch_log_metric_filter" "organizations_changes" {
  provider   = aws.eu-west-1
  name       = "OrganizationsChanges"
  log_group_name = aws_cloudwatch_log_group.cloudtrail.name
  pattern    = "{ ($.eventName = \"CreateAccount\") || ($.eventName = \"InviteAccountToOrganization\") || ($.eventName = \"RemoveAccountFromOrganization\") || ($.eventName = \"AttachPolicy\") || ($.eventName = \"DetachPolicy\") || ($.eventName = \"CreateOrganizationalUnit\") || ($.eventName = \"DeleteOrganizationalUnit\") || ($.eventName = \"MoveAccount\") || ($.eventName = \"UpdatePolicy\") || ($.eventName = \"DeletePolicy\") }"

  metric_transformation {
    name      = "OrganizationsChanges"
    namespace = "CloudTrailMetrics"
    value     = "1"
  }
}

resource "aws_cloudwatch_metric_alarm" "organizations_changes" {
  provider            = aws.eu-west-1
  alarm_name          = "OrganizationsChanges"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "OrganizationsChanges"
  namespace           = "CloudTrailMetrics"
  period              = "300"
  statistic           = "Sum"
  threshold           = "0"
  alarm_description   = "Monitor for AWS Organizations changes"
  alarm_actions       = [aws_sns_topic.security_alerts.arn]
}

