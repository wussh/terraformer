data "terraform_remote_state" "organization" {
  backend = "local"

  config = {
    path = "../../generated-connect/organizationap-southeast-1/terraform.tfstate"
  }
}
