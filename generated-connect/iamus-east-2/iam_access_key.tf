resource "aws_iam_access_key" "tfer--AKIAWQ3UNC5T4S6DSJLS" {
  depends_on = ["aws_iam_user.tfer--AIDAWQ3UNC5TY67KXTC4T"]
  status     = "Active"
  user       = "cybersecurity.assessor"
}

resource "aws_iam_access_key" "tfer--AKIAWQ3UNC5TQNATC4OC" {
  depends_on = ["aws_iam_user.tfer--AIDAWQ3UNC5T4SLAZT3IA"]
  status     = "Inactive"
  user       = "geobit.engineer"
}

resource "aws_iam_access_key" "tfer--AKIAWQ3UNC5TV3Y4TGZ2" {
  depends_on = ["aws_iam_user.tfer--AIDAWQ3UNC5TWH6BPX2H4"]
  status     = "Active"
  user       = "ses-smtp-user.20210304-021015"
}

resource "aws_iam_access_key" "tfer--AKIAWQ3UNC5TVFVJGIG6" {
  depends_on = ["aws_iam_user.tfer--AIDAWQ3UNC5TSLSLHALXR"]
  status     = "Active"
  user       = "ses-smtp-geobit-support"
}

resource "aws_iam_access_key" "tfer--AKIAWQ3UNC5TYU3D5AXG" {
  depends_on = ["aws_iam_user.tfer--AIDAWQ3UNC5T4SLAZT3IA"]
  status     = "Active"
  user       = "geobit.engineer"
}
