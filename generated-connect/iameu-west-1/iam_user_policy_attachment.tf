resource "aws_iam_user_policy_attachment" "tfer--geobit-002E-engineer_IAMUserChangePassword" {
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
  user       = "geobit.engineer"
}
