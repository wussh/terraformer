resource "aws_accessanalyzer_analyzer" "account_analyzer" {
  analyzer_name = "account-analyzer"
  type         = "ACCOUNT"
}
