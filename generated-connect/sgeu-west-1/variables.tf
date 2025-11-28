data "terraform_remote_state" "sg" {
  backend = "local"

  config = {
    path = "../../generated-connect/sgeu-west-1/terraform.tfstate"
  }
}
