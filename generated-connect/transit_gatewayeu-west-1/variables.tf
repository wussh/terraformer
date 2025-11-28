data "terraform_remote_state" "subnet" {
  backend = "local"

  config = {
    path = "../../generated-connect/subneteu-west-1/terraform.tfstate"
  }
}

data "terraform_remote_state" "transit_gateway" {
  backend = "local"

  config = {
    path = "../../generated-connect/transit_gatewayeu-west-1/terraform.tfstate"
  }
}

data "terraform_remote_state" "vpc" {
  backend = "local"

  config = {
    path = "../../generated-connect/vpceu-west-1/terraform.tfstate"
  }
}

data "terraform_remote_state" "vpn_connection" {
  backend = "local"

  config = {
    path = "../../generated-connect/vpn_connectioneu-west-1/terraform.tfstate"
  }
}
