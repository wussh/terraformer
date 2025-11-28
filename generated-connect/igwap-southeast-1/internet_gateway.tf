resource "aws_internet_gateway" "tfer--igw-0682b862" {
  vpc_id = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-9c958ffb_id}"
}
