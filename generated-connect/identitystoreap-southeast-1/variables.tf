data "terraform_remote_state" "identitystore" {
  backend = "local"

  config = {
    path = "../../generated-connect/identitystoreap-southeast-1/terraform.tfstate"
  }
}
