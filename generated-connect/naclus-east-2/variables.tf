data "terraform_remote_state" "subnet" {
  backend = "local"

  config = {
    path = "../../generated-connect/subnetus-east-2/terraform.tfstate"
  }
}

data "terraform_remote_state" "vpc" {
  backend = "local"

  config = {
    path = "../../generated-connect/vpcus-east-2/terraform.tfstate"
  }
}
