resource "aws_iam_user_group_membership" "tfer--cybersecurity-002E-assessor-002F-admin" {
  groups = ["admin"]
  user   = "cybersecurity.assessor"
}

resource "aws_iam_user_group_membership" "tfer--geobit-002E-engineer-002F-PowerUser" {
  groups = ["PowerUser"]
  user   = "geobit.engineer"
}

resource "aws_iam_user_group_membership" "tfer--geobit-002E-engineer-002F-admin" {
  groups = ["admin"]
  user   = "geobit.engineer"
}
