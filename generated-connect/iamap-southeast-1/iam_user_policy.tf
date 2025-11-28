resource "aws_iam_user_policy" "tfer--ses-smtp-geobit-support_AmazonSesSendingAccess" {
  name = "AmazonSesSendingAccess"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": "ses:SendRawEmail",
      "Effect": "Allow",
      "Resource": "*"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  user = "ses-smtp-geobit-support"
}

resource "aws_iam_user_policy" "tfer--ses-smtp-user-002E-20210304-021015_AmazonSesSendingAccess" {
  name = "AmazonSesSendingAccess"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": "ses:SendRawEmail",
      "Effect": "Allow",
      "Resource": "*"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  user = "ses-smtp-user.20210304-021015"
}
