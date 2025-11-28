data "terraform_remote_state" "sns" {
  backend = "local"

  config = {
    path = "../../generated-connect/snsap-southeast-1/terraform.tfstate"
  }
}

data "terraform_remote_state" "sqs" {
  backend = "local"

  config = {
    path = "../../generated-connect/sqsap-southeast-1/terraform.tfstate"
  }
}
