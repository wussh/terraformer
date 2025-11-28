data "terraform_remote_state" "organization" {
  backend = "local"

  config = {
    path = "../../generated-connect/organizationus-east-2/terraform.tfstate"
  }
}
