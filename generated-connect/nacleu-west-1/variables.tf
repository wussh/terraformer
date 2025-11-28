data "terraform_remote_state" "subnet" {
  backend = "local"

  config = {
    path = "../../generated-connect/subneteu-west-1/terraform.tfstate"
  }
}

data "terraform_remote_state" "vpc" {
  backend = "local"

  config = {
    path = "../../generated-connect/vpceu-west-1/terraform.tfstate"
  }
}
