data "terraform_remote_state" "sns" {
  backend = "local"

  config = {
    path = "../../generated-connect/snseu-west-1/terraform.tfstate"
  }
}

data "terraform_remote_state" "sqs" {
  backend = "local"

  config = {
    path = "../../generated-connect/sqseu-west-1/terraform.tfstate"
  }
}
