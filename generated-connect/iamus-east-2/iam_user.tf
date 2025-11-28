resource "aws_iam_user" "tfer--AIDAWQ3UNC5T4SLAZT3IA" {
  force_destroy = "false"
  name          = "geobit.engineer"
  path          = "/"
}

resource "aws_iam_user" "tfer--AIDAWQ3UNC5TSLSLHALXR" {
  force_destroy = "false"
  name          = "ses-smtp-geobit-support"
  path          = "/"
}

resource "aws_iam_user" "tfer--AIDAWQ3UNC5TWH6BPX2H4" {
  force_destroy = "false"
  name          = "ses-smtp-user.20210304-021015"
  path          = "/"
}

resource "aws_iam_user" "tfer--AIDAWQ3UNC5TY67KXTC4T" {
  force_destroy = "false"
  name          = "cybersecurity.assessor"
  path          = "/"

  tags = {
    AKIAWQ3UNC5T4S6DSJLS = "cybersecurity.assessor"
  }

  tags_all = {
    AKIAWQ3UNC5T4S6DSJLS = "cybersecurity.assessor"
  }
}
