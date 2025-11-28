resource "aws_organizations_organization" "tfer--Geobit" {
  aws_service_access_principals = ["sso.amazonaws.com"]
  feature_set                   = "ALL"
}
