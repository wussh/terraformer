data "terraform_remote_state" "sns" {
  backend = "local"

  config = {
    path = "../../generated-connect/snsus-east-2/terraform.tfstate"
  }
}

data "terraform_remote_state" "sqs" {
  backend = "local"

  config = {
    path = "../../generated-connect/sqsus-east-2/terraform.tfstate"
  }
}
