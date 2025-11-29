# Prowler Audit Remediation - Terraform Configuration

This directory contains Terraform configurations to remediate the security findings from the Prowler ThreatScore audit.

## Structure

- `iam-password-policy.tf` - IAM password policy configuration
- `iam-support-role.tf` - AWS Support role creation
- `access-analyzer-all-regions.tf` - Access Analyzer for all regions
- `cloudtrail-enhancements.tf` - CloudTrail file validation, server access logging, and KMS encryption
- `s3-secure-transport.tf` - S3 secure transport policy
- `aws-config-all-regions.tf` - AWS Config for all regions
- `security-hub-all-regions.tf` - Security Hub for all regions
- `cloudwatch-metric-filters.tf` - CloudWatch metric filters and alarms
- `cloudtrail-s3-data-events.tf` - S3 data event logging
- `macie.tf` - Amazon Macie configuration
- `provider.tf` - Terraform provider configuration

## Manual Actions Required

The following findings require manual intervention:

1. **1.1.2**: Enable hardware MFA for root account - Must be done via AWS Console
2. **1.1.11**: Rotate access keys older than 90 days:
   - `ses-smtp-geobit-support/AmazonSesSendingAccess`
   - `ses-smtp-user.20210304-021015/AmazonSesSendingAccess`
3. **1.2.1-1.2.2**: Refactor IAM policies from users to groups:
   - `geobit.engineer/IAMUserChangePassword`
   - `ses-smtp-geobit-support/AmazonSesSendingAccess`
   - `ses-smtp-user.20210304-021015/AmazonSesSendingAccess`
4. **1.3.1**: Remove AdministratorAccess policy attachments - Review and remove manually
5. **2.2.1**: Enable MFA delete on S3 bucket - Requires root account access
6. **2.3.16**: Secure Lightsail instances - Review application requirements first

## Usage

1. Review the configurations and adjust as needed
2. Initialize Terraform:
   ```bash
   terraform init
   ```
3. Review the plan:
   ```bash
   terraform plan
   ```
4. Apply the changes:
   ```bash
   terraform apply
   ```

## Notes

- Some resources may need to be imported if they already exist
- CloudTrail trail updates may require manual intervention if the trail is managed outside Terraform
- The CloudWatch log group for CloudTrail may need to be created or the data source adjusted
- S3 MFA delete requires root account access and cannot be managed via Terraform for existing buckets

## Regions Covered

All configurations cover the following regions:
- ap-northeast-1, ap-northeast-2, ap-northeast-3
- ap-south-1, ap-southeast-1, ap-southeast-2
- ca-central-1
- eu-central-1, eu-north-1, eu-west-1, eu-west-2, eu-west-3
- sa-east-1
- us-east-1, us-east-2
- us-west-1, us-west-2

