data "terraform_remote_state" "alb" {
  backend = "local"

  config = {
    path = "../../generated-connect/albus-east-2/terraform.tfstate"
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
