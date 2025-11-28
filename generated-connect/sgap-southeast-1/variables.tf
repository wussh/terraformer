data "terraform_remote_state" "sg" {
  backend = "local"

  config = {
    path = "../../generated-connect/sgap-southeast-1/terraform.tfstate"
  }
}
