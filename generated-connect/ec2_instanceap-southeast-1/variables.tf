data "terraform_remote_state" "ebs" {
  backend = "local"

  config = {
    path = "../../generated-connect/ebsap-southeast-1/terraform.tfstate"
  }
}

data "terraform_remote_state" "sg" {
  backend = "local"

  config = {
    path = "../../generated-connect/sgap-southeast-1/terraform.tfstate"
  }
}

data "terraform_remote_state" "subnet" {
  backend = "local"

  config = {
    path = "../../generated-connect/subnetap-southeast-1/terraform.tfstate"
  }
}
