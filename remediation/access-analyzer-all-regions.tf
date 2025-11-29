# Access Analyzer for all regions
# Fixes finding: 1.2.6

variable "access_analyzer_regions" {
  description = "List of AWS regions to enable Access Analyzer"
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

# Access Analyzer for each region
resource "aws_accessanalyzer_analyzer" "account_analyzer_ap_northeast_1" {
  provider      = aws.ap-northeast-1
  analyzer_name = "account-analyzer-ap-northeast-1"
  type          = "ACCOUNT"
}

resource "aws_accessanalyzer_analyzer" "account_analyzer_ap_northeast_2" {
  provider      = aws.ap-northeast-2
  analyzer_name = "account-analyzer-ap-northeast-2"
  type          = "ACCOUNT"
}

resource "aws_accessanalyzer_analyzer" "account_analyzer_ap_northeast_3" {
  provider      = aws.ap-northeast-3
  analyzer_name = "account-analyzer-ap-northeast-3"
  type          = "ACCOUNT"
}

resource "aws_accessanalyzer_analyzer" "account_analyzer_ap_south_1" {
  provider      = aws.ap-south-1
  analyzer_name = "account-analyzer-ap-south-1"
  type          = "ACCOUNT"
}

resource "aws_accessanalyzer_analyzer" "account_analyzer_ap_southeast_1" {
  provider      = aws.ap-southeast-1
  analyzer_name = "account-analyzer-ap-southeast-1"
  type          = "ACCOUNT"
}

resource "aws_accessanalyzer_analyzer" "account_analyzer_ap_southeast_2" {
  provider      = aws.ap-southeast-2
  analyzer_name = "account-analyzer-ap-southeast-2"
  type          = "ACCOUNT"
}

resource "aws_accessanalyzer_analyzer" "account_analyzer_ca_central_1" {
  provider      = aws.ca-central-1
  analyzer_name = "account-analyzer-ca-central-1"
  type          = "ACCOUNT"
}

resource "aws_accessanalyzer_analyzer" "account_analyzer_eu_central_1" {
  provider      = aws.eu-central-1
  analyzer_name = "account-analyzer-eu-central-1"
  type          = "ACCOUNT"
}

resource "aws_accessanalyzer_analyzer" "account_analyzer_eu_north_1" {
  provider      = aws.eu-north-1
  analyzer_name = "account-analyzer-eu-north-1"
  type          = "ACCOUNT"
}

resource "aws_accessanalyzer_analyzer" "account_analyzer_eu_west_1" {
  provider      = aws.eu-west-1
  analyzer_name = "account-analyzer-eu-west-1"
  type          = "ACCOUNT"
}

resource "aws_accessanalyzer_analyzer" "account_analyzer_eu_west_2" {
  provider      = aws.eu-west-2
  analyzer_name = "account-analyzer-eu-west-2"
  type          = "ACCOUNT"
}

resource "aws_accessanalyzer_analyzer" "account_analyzer_eu_west_3" {
  provider      = aws.eu-west-3
  analyzer_name = "account-analyzer-eu-west-3"
  type          = "ACCOUNT"
}

resource "aws_accessanalyzer_analyzer" "account_analyzer_sa_east_1" {
  provider      = aws.sa-east-1
  analyzer_name = "account-analyzer-sa-east-1"
  type          = "ACCOUNT"
}

resource "aws_accessanalyzer_analyzer" "account_analyzer_us_east_1" {
  provider      = aws.us-east-1
  analyzer_name = "account-analyzer-us-east-1"
  type          = "ACCOUNT"
}

resource "aws_accessanalyzer_analyzer" "account_analyzer_us_east_2" {
  provider      = aws.us-east-2
  analyzer_name = "account-analyzer-us-east-2"
  type          = "ACCOUNT"
}

resource "aws_accessanalyzer_analyzer" "account_analyzer_us_west_1" {
  provider      = aws.us-west-1
  analyzer_name = "account-analyzer-us-west-1"
  type          = "ACCOUNT"
}

resource "aws_accessanalyzer_analyzer" "account_analyzer_us_west_2" {
  provider      = aws.us-west-2
  analyzer_name = "account-analyzer-us-west-2"
  type          = "ACCOUNT"
}


