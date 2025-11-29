# AWS Support Role
# Fixes finding: 1.2.3

resource "aws_iam_role" "support_role" {
  name = "AWSSupportAccessRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "support.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Purpose = "AWS Support Access"
  }
}

resource "aws_iam_role_policy_attachment" "support_role_policy" {
  role       = aws_iam_role.support_role.name
  policy_arn = "arn:aws:iam::aws:policy/AWSSupportAccess"
}

