# Manual Actions Required for Prowler Audit Remediation

This document lists all findings that require manual intervention and cannot be fully automated via Terraform.

## Critical Priority

### 1.1.2 - Hardware MFA for Root Account
**Status:** Manual Action Required  
**Risk Level:** 5 (Critical)  
**Weight:** 1000

**Action:**
1. Log in to AWS Console as root user
2. Navigate to IAM → Security credentials
3. Under "Multi-factor authentication (MFA)", click "Assign MFA device"
4. Select "Hardware MFA device"
5. Follow the prompts to complete MFA device enrollment

**Note:** This cannot be automated as it requires physical access to the hardware MFA device and root account credentials.

---

## High Priority

### 1.3.1 - Remove AdministratorAccess Policies
**Status:** Automated Solution Available (High Risk - Review Required)  
**Risk Level:** 4 (High)  
**Weight:** 100

**Current State:**
- `AdministratorAccess` policy is attached to the `admin` group
- Group members: `geobit.engineer`, `cybersecurity.assessor`

**Remediation Options:**

**Option 1: Use Shell Script (Recommended for Quick Fix)**
```bash
cd remediation
./detach-administrator-access.sh
```

**Option 2: Use Terraform**
```bash
cd remediation
terraform init
terraform plan -target=null_resource.detach_administrator_access
terraform apply -target=null_resource.detach_administrator_access
```

**Option 3: Manual AWS CLI**
```bash
aws iam detach-group-policy \
  --group-name admin \
  --policy-arn arn:aws:iam::aws:policy/AdministratorAccess
```

**⚠️ CRITICAL WARNINGS:**
1. **Ensure you have alternative admin access** (root account or another admin user) before detaching
2. **Review what permissions are actually needed** by users in the admin group
3. **Create custom least-privilege policies** if needed before removing AdministratorAccess
4. **Test in non-production first** if possible
5. **Monitor CloudTrail** for access denied errors after removal

**Affected Resources:**
- AdministratorAccess policy attachment: `admin` group (us-east-1)

**Note:** This requires understanding application dependencies and should be done carefully to avoid breaking production systems. See `evidence/iam-1.3.1/README.md` for detailed guidance.

---

### 2.3.16 - Secure Lightsail Instances
**Status:** Manual Review Required  
**Risk Level:** 4 (High)  
**Weight:** 100

**Action:**
1. Review each Lightsail instance to understand its purpose and access requirements
2. Determine if public access is necessary
3. If public access is required:
   - Implement security groups/firewalls
   - Use VPN or bastion hosts
   - Restrict inbound access to trusted networks only
4. If public access is not required:
   - Remove public IP addresses
   - Use private networking
   - Implement VPN access

**Affected Instances (ap-southeast-1):**
- `i-00dfe55776aa6bfdb`
- `i-01f82542d58c7d274`
- `i-071bb5752c28a6e40`
- `i-0a244ba4559dc1acd`
- `i-0c6745eb1e6bf85e7`
- `i-0dd5861c15fbd1d16`
- `i-0e5b63dd60aa368d6`

**Note:** This requires understanding application requirements and network architecture.

---

## Medium Priority

### 1.1.11 - Rotate Access Keys Older Than 90 Days
**Status:** Manual Action Required  
**Risk Level:** 3 (Medium)  
**Weight:** 10

**Action:**
1. Identify applications/services using these access keys
2. Generate new access keys for each user
3. Update applications/services with new keys
4. Test to ensure functionality is maintained
5. Delete old access keys after verification

**Affected Users:**
- `ses-smtp-geobit-support/AmazonSesSendingAccess`
- `ses-smtp-user.20210304-021015/AmazonSesSendingAccess`

**Steps:**
1. Go to IAM → Users → [User Name] → Security credentials
2. Create new access key
3. Update application configuration with new key
4. Test application
5. Delete old access key

**Note:** Coordinate with application owners to avoid service disruption.

---

### 1.2.1-1.2.2 - Refactor IAM Policies to Groups
**Status:** Manual Review Required  
**Risk Level:** 1 (Low)  
**Weight:** 1

**Action:**
1. Review each user's current permissions
2. Create appropriate IAM groups
3. Move policies from users to groups
4. Add users to groups
5. Remove direct policy attachments from users
6. Test to ensure permissions are maintained

**Affected Users:**
- `geobit.engineer` (IAMUserChangePassword policy)
- `ses-smtp-geobit-support` (AmazonSesSendingAccess policy)
- `ses-smtp-user.20210304-021015` (AmazonSesSendingAccess policy)

**Example Terraform:**
```hcl
# Create group
resource "aws_iam_group" "ses_smtp_users" {
  name = "ses-smtp-users"
}

# Attach policy to group
resource "aws_iam_group_policy_attachment" "ses_smtp_access" {
  group      = aws_iam_group.ses_smtp_users.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSesSendingAccess"
}

# Add users to group
resource "aws_iam_user_group_membership" "ses_users" {
  user = aws_iam_user.ses_smtp_user.name
  groups = [aws_iam_group.ses_smtp_users.name]
}

# Remove direct policy attachment from user
# (This needs to be done manually or via import/state manipulation)
```

**Note:** This requires understanding user permissions and may require coordination with application owners.

---

### 2.2.1 - Enable MFA Delete on S3 Buckets
**Status:** Automated Script Available (Requires Root Account)  
**Risk Level:** 3 (Medium)  
**Weight:** 10

**Current State:**
- MFA Delete is NOT enabled on 3 critical S3 buckets storing audit logs
- Buckets affected:
  1. `aws-cloudtrail-access-logs-448531339111` (ap-southeast-1)
  2. `aws-cloudtrail-logs-448531339111-f2484876` (ap-southeast-1)
  3. `aws-config-delivery-448531339111` (eu-west-1)

**⚠️ CRITICAL REQUIREMENTS:**
1. **MUST use ROOT ACCOUNT** - IAM users cannot enable MFA Delete
2. **MUST have hardware MFA** - Virtual MFA devices are not supported
3. **Cannot be done via Console** - Only via AWS CLI
4. **Cannot be managed by Terraform** - Must be done manually/script

**Remediation Options:**

**Option 1: Use Automated Script (Recommended)**
```bash
cd remediation
# Configure root account credentials first
export AWS_PROFILE=root  # or aws configure --profile root
./enable-s3-mfa-delete.sh
```

**Option 2: Manual AWS CLI (Per Bucket)**
```bash
# 1. Enable versioning (if not already enabled)
aws s3api put-bucket-versioning \
  --bucket BUCKET_NAME \
  --versioning-configuration Status=Enabled \
  --region REGION

# 2. Enable MFA Delete (requires root account + hardware MFA code)
aws s3api put-bucket-versioning \
  --bucket BUCKET_NAME \
  --versioning-configuration Status=Enabled,MFADelete=Enabled \
  --mfa "arn:aws:iam::448531339111:mfa/root-account-mfa-device MFA_CODE" \
  --region REGION
```

**Note:** See `evidence/s3-2.2.1/README.md` for detailed instructions and troubleshooting.

**Note:** This requires root account access and cannot be managed via Terraform for existing buckets.

---

## Long-term Actions

### 1.2.7 - Central Identity Management
**Status:** Strategic Initiative  
**Risk Level:** 1 (Low)  
**Weight:** 1

**Action:**
1. Evaluate IAM Identity Center (formerly SSO) or SAML IdP options
2. Design identity federation architecture
3. Create IAM roles for federated access
4. Migrate users to federated authentication
5. Deprecate local IAM users

**Note:** This is a long-term strategic initiative that requires planning and coordination.

---

## Checklist

- [ ] Enable hardware MFA for root account
- [ ] Review and remove AdministratorAccess policies
- [ ] Secure Lightsail instances (7 instances)
- [ ] Rotate access keys for SES users (2 users)
- [ ] Refactor IAM policies to groups (3 users)
- [ ] Enable MFA delete on CloudTrail S3 bucket
- [ ] Plan central identity management strategy

---

## Notes

- All manual actions should be documented in change management system
- Test changes in non-production environments first when possible
- Coordinate with application owners before making changes that may affect services
- Keep audit trail of all manual changes

