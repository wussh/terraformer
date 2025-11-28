data "terraform_remote_state" "customer_gateway" {
  backend = "local"

  config = {
    path = "../../generated-connect/customer_gatewayeu-west-1/terraform.tfstate"
  }
}

data "terraform_remote_state" "vpn_gateway" {
  backend = "local"

  config = {
    path = "../../generated-connect/vpn_gatewayeu-west-1/terraform.tfstate"
  }
}
