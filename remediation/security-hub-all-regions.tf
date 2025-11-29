# Security Hub for all regions
# Fixes finding: 3.3.17

variable "security_hub_regions" {
  description = "List of AWS regions to enable Security Hub"
  type        = list(string)
  default = [
    "ap-northeast-1",
    "ap-northeast-2",
    "ap-northeast-3",
    "ap-south-1",
    "ap-southeast-1",
    "ap-southeast-2",
    "ca-central-1",
    "eu-central-1",
    "eu-north-1",
    "eu-west-1",
    "eu-west-2",
    "eu-west-3",
    "sa-east-1",
    "us-east-1",
    "us-east-2",
    "us-west-1",
    "us-west-2"
  ]
}

# Enable Security Hub in each region
resource "aws_securityhub_account" "security_hub_ap_northeast_1" {
  provider              = aws.ap-northeast-1
  enable_default_standards = true
}

resource "aws_securityhub_account" "security_hub_ap_northeast_2" {
  provider              = aws.ap-northeast-2
  enable_default_standards = true
}

resource "aws_securityhub_account" "security_hub_ap_northeast_3" {
  provider              = aws.ap-northeast-3
  enable_default_standards = true
}

resource "aws_securityhub_account" "security_hub_ap_south_1" {
  provider              = aws.ap-south-1
  enable_default_standards = true
}

resource "aws_securityhub_account" "security_hub_ap_southeast_1" {
  provider              = aws.ap-southeast-1
  enable_default_standards = true
}

resource "aws_securityhub_account" "security_hub_ap_southeast_2" {
  provider              = aws.ap-southeast-2
  enable_default_standards = true
}

resource "aws_securityhub_account" "security_hub_ca_central_1" {
  provider              = aws.ca-central-1
  enable_default_standards = true
}

resource "aws_securityhub_account" "security_hub_eu_central_1" {
  provider              = aws.eu-central-1
  enable_default_standards = true
}

resource "aws_securityhub_account" "security_hub_eu_north_1" {
  provider              = aws.eu-north-1
  enable_default_standards = true
}

resource "aws_securityhub_account" "security_hub_eu_west_1" {
  provider              = aws.eu-west-1
  enable_default_standards = true
}

resource "aws_securityhub_account" "security_hub_eu_west_2" {
  provider              = aws.eu-west-2
  enable_default_standards = true
}

resource "aws_securityhub_account" "security_hub_eu_west_3" {
  provider              = aws.eu-west-3
  enable_default_standards = true
}

resource "aws_securityhub_account" "security_hub_sa_east_1" {
  provider              = aws.sa-east-1
  enable_default_standards = true
}

resource "aws_securityhub_account" "security_hub_us_east_1" {
  provider              = aws.us-east-1
  enable_default_standards = true
}

resource "aws_securityhub_account" "security_hub_us_east_2" {
  provider              = aws.us-east-2
  enable_default_standards = true
}

resource "aws_securityhub_account" "security_hub_us_west_1" {
  provider              = aws.us-west-1
  enable_default_standards = true
}

resource "aws_securityhub_account" "security_hub_us_west_2" {
  provider              = aws.us-west-2
  enable_default_standards = true
}

# Subscribe to security standards - CIS AWS Foundations
resource "aws_securityhub_standards_subscription" "cis_aws_foundations_ap_northeast_1" {
  provider      = aws.ap-northeast-1
  standards_arn = "arn:aws:securityhub:::ruleset/cis-aws-foundations-benchmark/v/1.2.0"
  depends_on    = [aws_securityhub_account.security_hub_ap_northeast_1]
}

resource "aws_securityhub_standards_subscription" "cis_aws_foundations_ap_northeast_2" {
  provider      = aws.ap-northeast-2
  standards_arn = "arn:aws:securityhub:::ruleset/cis-aws-foundations-benchmark/v/1.2.0"
  depends_on    = [aws_securityhub_account.security_hub_ap_northeast_2]
}

resource "aws_securityhub_standards_subscription" "cis_aws_foundations_ap_northeast_3" {
  provider      = aws.ap-northeast-3
  standards_arn = "arn:aws:securityhub:::ruleset/cis-aws-foundations-benchmark/v/1.2.0"
  depends_on    = [aws_securityhub_account.security_hub_ap_northeast_3]
}

resource "aws_securityhub_standards_subscription" "cis_aws_foundations_ap_south_1" {
  provider      = aws.ap-south-1
  standards_arn = "arn:aws:securityhub:::ruleset/cis-aws-foundations-benchmark/v/1.2.0"
  depends_on    = [aws_securityhub_account.security_hub_ap_south_1]
}

resource "aws_securityhub_standards_subscription" "cis_aws_foundations_ap_southeast_1" {
  provider      = aws.ap-southeast-1
  standards_arn = "arn:aws:securityhub:::ruleset/cis-aws-foundations-benchmark/v/1.2.0"
  depends_on    = [aws_securityhub_account.security_hub_ap_southeast_1]
}

resource "aws_securityhub_standards_subscription" "cis_aws_foundations_ap_southeast_2" {
  provider      = aws.ap-southeast-2
  standards_arn = "arn:aws:securityhub:::ruleset/cis-aws-foundations-benchmark/v/1.2.0"
  depends_on    = [aws_securityhub_account.security_hub_ap_southeast_2]
}

resource "aws_securityhub_standards_subscription" "cis_aws_foundations_ca_central_1" {
  provider      = aws.ca-central-1
  standards_arn = "arn:aws:securityhub:::ruleset/cis-aws-foundations-benchmark/v/1.2.0"
  depends_on    = [aws_securityhub_account.security_hub_ca_central_1]
}

resource "aws_securityhub_standards_subscription" "cis_aws_foundations_eu_central_1" {
  provider      = aws.eu-central-1
  standards_arn = "arn:aws:securityhub:::ruleset/cis-aws-foundations-benchmark/v/1.2.0"
  depends_on    = [aws_securityhub_account.security_hub_eu_central_1]
}

resource "aws_securityhub_standards_subscription" "cis_aws_foundations_eu_north_1" {
  provider      = aws.eu-north-1
  standards_arn = "arn:aws:securityhub:::ruleset/cis-aws-foundations-benchmark/v/1.2.0"
  depends_on    = [aws_securityhub_account.security_hub_eu_north_1]
}

resource "aws_securityhub_standards_subscription" "cis_aws_foundations_eu_west_1" {
  provider      = aws.eu-west-1
  standards_arn = "arn:aws:securityhub:::ruleset/cis-aws-foundations-benchmark/v/1.2.0"
  depends_on    = [aws_securityhub_account.security_hub_eu_west_1]
}

resource "aws_securityhub_standards_subscription" "cis_aws_foundations_eu_west_2" {
  provider      = aws.eu-west-2
  standards_arn = "arn:aws:securityhub:::ruleset/cis-aws-foundations-benchmark/v/1.2.0"
  depends_on    = [aws_securityhub_account.security_hub_eu_west_2]
}

resource "aws_securityhub_standards_subscription" "cis_aws_foundations_eu_west_3" {
  provider      = aws.eu-west-3
  standards_arn = "arn:aws:securityhub:::ruleset/cis-aws-foundations-benchmark/v/1.2.0"
  depends_on    = [aws_securityhub_account.security_hub_eu_west_3]
}

resource "aws_securityhub_standards_subscription" "cis_aws_foundations_sa_east_1" {
  provider      = aws.sa-east-1
  standards_arn = "arn:aws:securityhub:::ruleset/cis-aws-foundations-benchmark/v/1.2.0"
  depends_on    = [aws_securityhub_account.security_hub_sa_east_1]
}

resource "aws_securityhub_standards_subscription" "cis_aws_foundations_us_east_1" {
  provider      = aws.us-east-1
  standards_arn = "arn:aws:securityhub:::ruleset/cis-aws-foundations-benchmark/v/1.2.0"
  depends_on    = [aws_securityhub_account.security_hub_us_east_1]
}

resource "aws_securityhub_standards_subscription" "cis_aws_foundations_us_east_2" {
  provider      = aws.us-east-2
  standards_arn = "arn:aws:securityhub:::ruleset/cis-aws-foundations-benchmark/v/1.2.0"
  depends_on    = [aws_securityhub_account.security_hub_us_east_2]
}

resource "aws_securityhub_standards_subscription" "cis_aws_foundations_us_west_1" {
  provider      = aws.us-west-1
  standards_arn = "arn:aws:securityhub:::ruleset/cis-aws-foundations-benchmark/v/1.2.0"
  depends_on    = [aws_securityhub_account.security_hub_us_west_1]
}

resource "aws_securityhub_standards_subscription" "cis_aws_foundations_us_west_2" {
  provider      = aws.us-west-2
  standards_arn = "arn:aws:securityhub:::ruleset/cis-aws-foundations-benchmark/v/1.2.0"
  depends_on    = [aws_securityhub_account.security_hub_us_west_2]
}

