data "terraform_remote_state" "ebs" {
  backend = "local"

  config = {
    path = "../../generated-connect/ebsus-east-2/terraform.tfstate"
  }
}

data "terraform_remote_state" "sg" {
  backend = "local"

  config = {
    path = "../../generated-connect/sgus-east-2/terraform.tfstate"
  }
}

data "terraform_remote_state" "subnet" {
  backend = "local"

  config = {
    path = "../../generated-connect/subnetus-east-2/terraform.tfstate"
  }
}
