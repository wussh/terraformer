# Quick Start Guide

## Prerequisites

- Terraform >= 1.0
- AWS CLI configured with appropriate credentials
- Permissions to create IAM roles, Security Hub, Config, CloudTrail resources, etc.

## Quick Deployment

```bash
# Navigate to remediation directory
cd remediation

# Initialize Terraform
terraform init

# Review what will be created
terraform plan

# Apply changes (after review)
terraform apply
```

## What Gets Created

### Immediate Impact (Low Risk)
- ✅ IAM password policy (account-wide)
- ✅ AWS Support role
- ✅ Access Analyzer (17 regions)
- ✅ Security Hub (17 regions)
- ✅ AWS Config (eu-west-1, expandable)
- ✅ CloudWatch metric filters and alarms
- ✅ S3 secure transport policy
- ✅ Macie configuration

### Requires Review
- ⚠️ CloudTrail KMS encryption (may affect existing trail)
- ⚠️ CloudTrail server access logging (creates new S3 bucket)

## Critical Manual Actions (Do First!)

1. **Enable Hardware MFA for Root** (5 minutes)
   - AWS Console → IAM → Security credentials → Assign MFA device

2. **Review AdministratorAccess Policies** (30 minutes)
   - Identify all attachments
   - Plan least-privilege replacements

3. **Secure Lightsail Instances** (1-2 hours)
   - Review 7 instances in ap-southeast-1
   - Remove public access or implement proper security

## Phased Approach

### Phase 1: Quick Wins (Day 1)
```bash
# Apply low-risk configurations
terraform apply -target=aws_iam_account_password_policy.strict_password_policy
terraform apply -target=aws_iam_role.support_role
terraform apply -target=aws_s3_bucket_policy.cloudtrail_secure_transport
```

### Phase 2: Monitoring (Day 2-3)
```bash
# Enable monitoring services
terraform apply -target=aws_securityhub_account.security_hub_*
terraform apply -target=aws_accessanalyzer_analyzer.account_analyzer_*
terraform apply -target=aws_cloudwatch_log_metric_filter.*
```

### Phase 3: Advanced (Week 2)
- CloudTrail enhancements
- AWS Config expansion
- Macie configuration

## Verification

After applying, verify with:

```bash
# Check Security Hub status
aws securityhub describe-hub --region eu-west-1

# Check Access Analyzer
aws accessanalyzer list-analyzers --region eu-west-1

# Check CloudWatch alarms
aws cloudwatch describe-alarms --alarm-names-prefix "UnauthorizedAPICalls" --region eu-west-1
```

## Rollback

If issues occur:

```bash
# Destroy specific resources
terraform destroy -target=aws_securityhub_account.security_hub_eu_west_1

# Or destroy all
terraform destroy
```

## Cost Estimate

Approximate monthly costs:
- Security Hub: ~$0.0015 per finding check (varies by region)
- AWS Config: ~$0.003 per configuration item recorded
- Macie: ~$1.00 per GB scanned
- CloudWatch: Standard pricing for metrics and alarms
- S3: Storage and request costs

**Estimated total**: $50-200/month depending on usage

## Common Issues

### "Provider configuration not found"
- Ensure `providers.tf` is in the same directory
- Run `terraform init` again

### "Resource already exists"
- Use `terraform import` to import existing resources
- Or adjust resource names

### "Insufficient permissions"
- Verify IAM permissions include:
  - SecurityHub: `securityhub:*`
  - Config: `config:*`
  - CloudTrail: `cloudtrail:*`
  - IAM: `iam:*` (for password policy)

## Next Steps

1. ✅ Complete manual actions (see `MANUAL_ACTIONS.md`)
2. ✅ Monitor CloudWatch alarms
3. ✅ Review Security Hub findings
4. ✅ Expand Config to all regions
5. ✅ Set up automated remediation

