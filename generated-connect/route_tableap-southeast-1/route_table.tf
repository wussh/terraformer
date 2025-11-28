resource "aws_route_table" "tfer--rtb-91cea0f7" {
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "igw-0682b862"
  }

  vpc_id = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-9c958ffb_id}"
}
