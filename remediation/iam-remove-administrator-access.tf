# 1.3.1: Remove AdministratorAccess Policy from admin group
# This remediates Prowler finding: iam_aws_attached_policy_no_administrative_privileges
# Risk Level: High
#
# WARNING: This will remove full administrative access from the admin group.
# Ensure you have alternative access methods (e.g., break-glass account) before applying.
# The admin group currently contains: geobit.engineer, cybersecurity.assessor
#
# IMPORTANT: Before applying this, ensure you have:
# 1. Alternative admin access (e.g., root account or another admin user)
# 2. Reviewed what permissions are actually needed by users in the admin group
# 3. Created custom least-privilege policies if needed
#
# Approach: Use null_resource to detach the policy via AWS CLI
# This is necessary because Terraform can't directly "detach" a policy that exists
# outside of Terraform state without first importing it.

resource "null_resource" "detach_administrator_access" {
  triggers = {
    group_name = "admin"
    policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
    # Change this value to trigger re-execution if needed
    force_detach = "1"
  }

  provisioner "local-exec" {
    command = <<-EOT
      echo "Detaching AdministratorAccess policy from admin group..."
      aws iam detach-group-policy \
        --group-name admin \
        --policy-arn arn:aws:iam::aws:policy/AdministratorAccess
      echo "Successfully detached AdministratorAccess policy"
    EOT
  }

  # Optional: Re-attach on destroy (commented out for safety)
  # Uncomment only if you want to restore the policy when destroying this resource
  # provisioner "local-exec" {
  #   when    = destroy
  #   command = <<-EOT
  #     echo "Re-attaching AdministratorAccess policy to admin group..."
  #     aws iam attach-group-policy \
  #       --group-name admin \
  #       --policy-arn arn:aws:iam::aws:policy/AdministratorAccess || true
  #   EOT
  # }
}

