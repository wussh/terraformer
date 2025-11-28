data "terraform_remote_state" "customer_gateway" {
  backend = "local"

  config = {
    path = "../../generated-connect/customer_gatewayus-east-2/terraform.tfstate"
  }
}

data "terraform_remote_state" "vpn_gateway" {
  backend = "local"

  config = {
    path = "../../generated-connect/vpn_gatewayus-east-2/terraform.tfstate"
  }
}
