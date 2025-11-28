data "terraform_remote_state" "identitystore" {
  backend = "local"

  config = {
    path = "../../generated-connect/identitystoreus-east-2/terraform.tfstate"
  }
}
