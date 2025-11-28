data "terraform_remote_state" "vpc" {
  backend = "local"

  config = {
    path = "../../generated-connect/vpcus-east-2/terraform.tfstate"
  }
}
