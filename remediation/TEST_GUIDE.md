# Testing Guide - Start Small

This guide helps you test the Terraform configuration with a minimal change before applying everything.

## Step 1: Test with IAM Password Policy (Recommended)

The IAM password policy is the safest first test because:
- ✅ Single resource, no dependencies
- ✅ Low risk (only sets password requirements)
- ✅ Easy to verify in AWS Console
- ✅ Can be easily rolled back

### Test Steps

1. **Navigate to test directory:**
   ```bash
   cd /home/wush/playground/terraformer/remediation
   ```

2. **Initialize Terraform (if not done):**
   ```bash
   terraform init
   ```

3. **Test with just the password policy:**
   ```bash
   # Plan only the password policy
   terraform plan -target=aws_iam_account_password_policy.strict_password_policy
   ```

4. **Review the plan:**
   - Should show 1 resource to add
   - Verify the settings match your requirements

5. **Apply the change:**
   ```bash
   terraform apply -target=aws_iam_account_password_policy.strict_password_policy
   ```

6. **Verify in AWS Console:**
   - Go to IAM → Account settings → Password policy
   - Verify all settings are applied correctly

7. **If successful, proceed with more resources:**
   ```bash
   # Next: Apply Support role
   terraform apply -target=aws_iam_role.support_role
   
   # Then: Apply SNS topic (for CloudWatch alarms)
   terraform apply -target=aws_sns_topic.security_alerts
   ```

## Alternative: Test with Support Role

If you prefer to test with a different resource:

```bash
# Plan the support role
terraform plan -target=aws_iam_role.support_role -target=aws_iam_role_policy_attachment.support_role_policy

# Apply it
terraform apply -target=aws_iam_role.support_role -target=aws_iam_role_policy_attachment.support_role_policy
```

## Verification Commands

After applying, verify with AWS CLI:

```bash
# Check password policy
aws iam get-account-password-policy

# Check support role (if applied)
aws iam get-role --role-name AWSSupportAccessRole
```

## Rollback (if needed)

If something goes wrong:

```bash
# Destroy just the password policy
terraform destroy -target=aws_iam_account_password_policy.strict_password_policy

# Or destroy everything
terraform destroy
```

## Next Steps After Successful Test

Once the test works:

1. ✅ Apply IAM resources (password policy, support role)
2. ✅ Apply SNS topic for alerts
3. ✅ Apply CloudWatch log group
4. ✅ Apply CloudWatch metric filters (one at a time)
5. ✅ Apply Security Hub (one region at a time)
6. ✅ Apply Access Analyzer (one region at a time)
7. ✅ Apply remaining resources

## Phased Approach

### Phase 1: IAM (Low Risk)
```bash
terraform apply \
  -target=aws_iam_account_password_policy.strict_password_policy \
  -target=aws_iam_role.support_role \
  -target=aws_iam_role_policy_attachment.support_role_policy
```

### Phase 2: Monitoring Setup
```bash
terraform apply \
  -target=aws_sns_topic.security_alerts \
  -target=aws_cloudwatch_log_group.cloudtrail
```

### Phase 3: CloudWatch Alarms (One at a time)
```bash
terraform apply -target=aws_cloudwatch_log_metric_filter.root_usage
terraform apply -target=aws_cloudwatch_metric_alarm.root_usage
```

### Phase 4: Regional Services (One region at a time)
```bash
# Start with eu-west-1
terraform apply \
  -target=aws_securityhub_account.security_hub_eu_west_1 \
  -target=aws_accessanalyzer_analyzer.account_analyzer_eu_west_1
```

## Troubleshooting

### Error: "Access Denied"
- Check IAM permissions
- Ensure you have `iam:UpdateAccountPasswordPolicy` permission

### Error: "Resource already exists"
- The password policy might already be configured
- Use `terraform import` to import existing resources

### Error: "Provider configuration not found"
- Run `terraform init` again
- Check that `providers.tf` exists

## Safety Tips

1. **Always run `terraform plan` first**
2. **Use `-target` to limit scope**
3. **Test in non-production first** (if possible)
4. **Keep backups** of current state
5. **Monitor AWS Console** after each apply

