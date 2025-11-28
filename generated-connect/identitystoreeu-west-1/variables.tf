data "terraform_remote_state" "identitystore" {
  backend = "local"

  config = {
    path = "../../generated-connect/identitystoreeu-west-1/terraform.tfstate"
  }
}
