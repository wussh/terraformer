resource "aws_iam_group" "tfer--PowerUser" {
  name = "PowerUser"
  path = "/"
}

resource "aws_iam_group" "tfer--admin" {
  name = "admin"
  path = "/"
}
