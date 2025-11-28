data "terraform_remote_state" "organization" {
  backend = "local"

  config = {
    path = "../../generated-connect/organizationeu-west-1/terraform.tfstate"
  }
}
