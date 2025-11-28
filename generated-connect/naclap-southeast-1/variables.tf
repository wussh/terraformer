data "terraform_remote_state" "subnet" {
  backend = "local"

  config = {
    path = "../../generated-connect/subnetap-southeast-1/terraform.tfstate"
  }
}

data "terraform_remote_state" "vpc" {
  backend = "local"

  config = {
    path = "../../generated-connect/vpcap-southeast-1/terraform.tfstate"
  }
}
