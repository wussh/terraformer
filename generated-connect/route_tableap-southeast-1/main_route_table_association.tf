resource "aws_main_route_table_association" "tfer--vpc-9c958ffb" {
  route_table_id = "${data.terraform_remote_state.route_table.outputs.aws_route_table_tfer--rtb-91cea0f7_id}"
  vpc_id         = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-9c958ffb_id}"
}
