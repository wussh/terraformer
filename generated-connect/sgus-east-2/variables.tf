data "terraform_remote_state" "sg" {
  backend = "local"

  config = {
    path = "../../generated-connect/sgus-east-2/terraform.tfstate"
  }
}
