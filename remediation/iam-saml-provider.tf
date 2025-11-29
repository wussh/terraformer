# IAM SAML Provider for Identity Federation
# Fixes finding: 1.2.7 - Ensure IAM users are managed centrally via identity federation
# Check: iam_check_saml_providers_sts
# Risk Level: Low
# Category: IAM → Authorization

# This template creates a SAML provider for identity federation.
# IMPORTANT: This requires SAML metadata from your identity provider (e.g., Active Directory, Okta, Azure AD)

# ============================================================================
# SAML Provider
# ============================================================================
# Uncomment and configure when you have SAML metadata from your identity provider
#
# resource "aws_iam_saml_provider" "corp_saml" {
#   name                   = "CorpSAMLProvider"
#   saml_metadata_document = file("${path.module}/saml-metadata.xml")
#
#   tags = {
#     Name        = "corp-saml-provider"
#     Purpose     = "Identity federation for centralized user management"
#     Environment = "production"
#   }
# }

# ============================================================================
# IAM Role for SAML Users
# ============================================================================
# Example role that trusts the SAML provider
# Users authenticated via SAML can assume this role
#
# resource "aws_iam_role" "saml_user_role" {
#   name = "SAMLUserRole"
#
#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Effect = "Allow"
#         Principal = {
#           Federated = aws_iam_saml_provider.corp_saml.arn
#         }
#         Action = "sts:AssumeRoleWithSAML"
#         Condition = {
#           StringEquals = {
#             "SAML:aud" = "https://signin.aws.amazon.com/saml"
#           }
#         }
#       }
#     ]
#   })
#
#   tags = {
#     Name = "saml-user-role"
#   }
# }

# ============================================================================
# Alternative: OIDC Provider (for GitHub, Google, etc.)
# ============================================================================
# Uncomment if using OIDC instead of SAML
#
# resource "aws_iam_openid_connect_provider" "github" {
#   url = "https://token.actions.githubusercontent.com"
#
#   client_id_list = [
#     "sts.amazonaws.com"
#   ]
#
#   thumbprint_list = [
#     "6938fd4d98bab03faadb97b34396831e3780aea1"  # GitHub's certificate thumbprint
#   ]
#
#   tags = {
#     Name = "github-oidc-provider"
#   }
# }

# ============================================================================
# Notes
# ============================================================================
# 1. SAML metadata document must be obtained from your identity provider
# 2. The metadata document is typically an XML file
# 3. Place the metadata file in the same directory as this Terraform file
# 4. Update the file path in the resource above
# 5. Coordinate with your identity/security team for SAML configuration
# 6. Test federated access before migrating all users
# 7. Keep some IAM users for break-glass access

# ============================================================================
# AWS IAM Identity Center (Alternative - Recommended for AWS-native)
# ============================================================================
# IAM Identity Center is the AWS-native solution for centralized identity
# It requires AWS Organizations and is managed via AWS Console or separate Terraform
# 
# To enable IAM Identity Center:
# 1. Enable AWS Organizations (if not already enabled)
# 2. Go to AWS IAM Identity Center in AWS Console
# 3. Enable Identity Center
# 4. Configure identity source
# 5. Create permission sets
# 6. Assign users/groups to accounts
#
# Terraform resources for IAM Identity Center:
# - aws_ssoadmin_instance
# - aws_ssoadmin_permission_set
# - aws_ssoadmin_account_assignment
#
# Note: IAM Identity Center is typically managed at the organization level,
# not at the individual account level

