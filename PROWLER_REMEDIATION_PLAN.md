# Prowler ThreatScore Remediation Plan

## Executive Summary
**Current Threat Score:** 80.86%
**Account ID:** 448531339111
**Primary Region:** eu-west-1

This plan addresses 40 security findings across 4 compliance pillars to improve the overall security posture.

---

## Priority Classification

### Critical Priority (Risk Level 5)
- **1.1.2**: Hardware MFA for root account

### High Priority (Risk Level 4)
- **1.3.1**: Remove AdministratorAccess policies
- **2.3.16**: Lightsail instances publicly accessible (7 instances)

### Medium Priority (Risk Level 3)
- **1.1.4-1.1.9**: IAM password policy requirements
- **1.1.11**: Access key rotation (90 days)
- **1.1.12**: Password expiration (90 days)
- **2.2.1**: S3 MFA delete
- **3.3.4**: Root account usage monitoring
- **3.3.6**: CloudTrail configuration changes monitoring
- **3.3.11**: Security group changes monitoring
- **3.3.17**: Security Hub enabled
- **4.1.1**: S3 secure transport policy
- **4.2.3**: CloudTrail KMS encryption

### Low Priority (Risk Level 1-2)
- **1.2.1-1.2.2**: IAM policies attached to users
- **1.2.3**: Support role creation
- **1.2.6**: Access Analyzer enabled (17 regions)
- **1.2.7**: Central identity management
- **2.2.2**: Macie enabled
- **3.1.2-3.1.6**: CloudTrail enhancements
- **3.3.1**: AWS Config enabled (17 regions)
- **3.3.2-3.3.16**: CloudWatch metric filters and alarms

---

## Remediation Plan by Pillar

### 1. Identity and Access Management (IAM)

#### 1.1 Authentication
- **1.1.2**: Enable hardware MFA for root account (Manual - requires console access)
- **1.1.4**: Set IAM password minimum length to 14 characters
- **1.1.5**: Configure password reuse prevention (24 passwords)
- **1.1.6**: Require at least one number in passwords
- **1.1.7**: Require at least one symbol in passwords
- **1.1.8**: Require at least one lowercase letter
- **1.1.9**: Require at least one uppercase letter
- **1.1.11**: Rotate access keys older than 90 days (Manual - requires key rotation)
  - `ses-smtp-geobit-support/AmazonSesSendingAccess`
  - `ses-smtp-user.20210304-021015/AmazonSesSendingAccess`
- **1.1.12**: Set password expiration to 90 days

#### 1.2 Authorization
- **1.2.1-1.2.2**: Move policies from users to groups/roles
  - `geobit.engineer/IAMUserChangePassword`
  - `ses-smtp-geobit-support/AmazonSesSendingAccess`
  - `ses-smtp-user.20210304-021015/AmazonSesSendingAccess`
- **1.2.3**: Create AWS Support role
- **1.2.6**: Enable Access Analyzer in all 17 regions
- **1.2.7**: Implement central identity management (IAM Identity Center/SAML)

#### 1.3 Privilege Escalation Prevention
- **1.3.1**: Remove AdministratorAccess policy attachments

---

### 2. Attack Surface

#### 2.2 Storage
- **2.2.1**: Enable MFA delete on S3 bucket `aws-cloudtrail-logs-448531339111-f2484876` (ap-southeast-1)
- **2.2.2**: Enable Amazon Macie in ap-southeast-1

#### 2.3 Application
- **2.3.16**: Remove public access from 7 Lightsail instances in ap-southeast-1
  - `i-00dfe55776aa6bfdb`
  - `i-01f82542d58c7d274`
  - `i-071bb5752c28a6e40`
  - `i-0a244ba4559dc1acd`
  - `i-0c6745eb1e6bf85e7`
  - `i-0dd5861c15fbd1d16`
  - `i-0e5b63dd60aa368d6`

---

### 3. Logging and Monitoring

#### 3.1 Logging
- **3.1.2**: Enable CloudTrail log file validation (`management-events` in us-east-2)
- **3.1.3**: Enable server access logging on CloudTrail S3 bucket
- **3.1.5**: Enable S3 object-level write event logging
- **3.1.6**: Enable S3 object-level read event logging

#### 3.3 Monitoring
- **3.3.1**: Enable AWS Config in all 17 regions
- **3.3.2**: Create CloudWatch metric filter for unauthorized API calls
- **3.3.3**: Create CloudWatch metric filter for console sign-in without MFA
- **3.3.4**: Create CloudWatch metric filter for root account usage
- **3.3.5**: Create CloudWatch metric filter for IAM policy changes
- **3.3.6**: Create CloudWatch metric filter for CloudTrail configuration changes
- **3.3.7**: Create CloudWatch metric filter for console authentication failures
- **3.3.8**: Create CloudWatch metric filter for KMS CMK disable/deletion
- **3.3.9**: Create CloudWatch metric filter for S3 bucket policy changes
- **3.3.10**: Create CloudWatch metric filter for AWS Config changes
- **3.3.11**: Create CloudWatch metric filter for security group changes
- **3.3.12**: Create CloudWatch metric filter for NACL changes
- **3.3.13**: Create CloudWatch metric filter for network gateway changes
- **3.3.14**: Create CloudWatch metric filter for route table changes
- **3.3.15**: Create CloudWatch metric filter for VPC changes
- **3.3.16**: Create CloudWatch metric filter for AWS Organizations changes
- **3.3.17**: Enable Security Hub in all 17 regions

---

### 4. Encryption

#### 4.1 In-Transit
- **4.1.1**: Add S3 bucket policy to deny HTTP requests (enforce HTTPS)
  - Bucket: `aws-cloudtrail-logs-448531339111-f2484876` (ap-southeast-1)

#### 4.2 At-Rest
- **4.2.3**: Enable KMS encryption for CloudTrail logs
  - Trail: `management-events` (us-east-2)

---

## Implementation Strategy

### Phase 1: Critical & High Priority (Week 1)
1. Enable hardware MFA for root account (Manual)
2. Remove AdministratorAccess policies
3. Secure Lightsail instances
4. Implement IAM password policy
5. Rotate old access keys (Manual)

### Phase 2: Medium Priority (Week 2)
1. Enable Access Analyzer in all regions
2. Enable Security Hub in all regions
3. Enable AWS Config in all regions
4. Configure CloudTrail enhancements
5. Enable S3 secure transport
6. Enable CloudTrail KMS encryption
7. Create critical CloudWatch alarms

### Phase 3: Low Priority & Monitoring (Week 3)
1. Create remaining CloudWatch metric filters
2. Enable Macie
3. Enable S3 MFA delete
4. Create Support role
5. Refactor IAM user policies to groups

### Phase 4: Long-term (Ongoing)
1. Implement central identity management (IAM Identity Center)
2. Continuous monitoring and alerting
3. Regular access reviews

---

## Manual Actions Required

The following items require manual intervention and cannot be fully automated:

1. **1.1.2**: Enable hardware MFA for root account - Must be done via AWS Console
2. **1.1.11**: Rotate access keys - Requires generating new keys and updating applications
3. **1.2.1-1.2.2**: Refactor IAM policies - Requires understanding application dependencies
4. **2.3.16**: Secure Lightsail instances - Requires understanding application requirements

---

## Estimated Impact

- **Security Score Improvement**: Expected to increase from 80.86% to ~95%+
- **Risk Reduction**: Addresses 40 security findings
- **Compliance**: Improves alignment with CIS AWS Foundations Benchmark and AWS Security Best Practices

---

## Notes

- All regions mentioned in findings: ap-northeast-1, ap-northeast-2, ap-northeast-3, ap-south-1, ap-southeast-1, ap-southeast-2, ca-central-1, eu-central-1, eu-north-1, eu-west-1, eu-west-2, eu-west-3, sa-east-1, us-east-1, us-east-2, us-west-1, us-west-2
- Primary account: 448531339111
- CloudTrail bucket: aws-cloudtrail-logs-448531339111-f2484876
- CloudTrail trail: management-events (us-east-2)

