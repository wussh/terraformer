data "terraform_remote_state" "vpc" {
  backend = "local"

  config = {
    path = "../../generated-connect/vpcap-southeast-1/terraform.tfstate"
  }
}
