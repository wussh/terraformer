resource "aws_route53_record" "tfer--Z001446939YCN1F8RKCU0__amazonses-002E-geobit-002E-co-002E-id-002E-_TXT_" {
  multivalue_answer_routing_policy = "false"
  name                             = "_amazonses.geobit.co.id"
  records                          = ["+7zbxvYPqN3aghBT/NimyFk4R5RkN6TUG2GXNpfidGI="]
  ttl                              = "1800"
  type                             = "TXT"
  zone_id                          = "${aws_route53_zone.tfer--Z001446939YCN1F8RKCU0_geobit-002E-co-002E-id.zone_id}"
}

resource "aws_route53_record" "tfer--Z001446939YCN1F8RKCU0_geobit-002E-co-002E-id-002E-_A_" {
  multivalue_answer_routing_policy = "false"
  name                             = "geobit.co.id"
  records                          = ["3.1.35.219"]
  ttl                              = "1800"
  type                             = "A"
  zone_id                          = "${aws_route53_zone.tfer--Z001446939YCN1F8RKCU0_geobit-002E-co-002E-id.zone_id}"
}

resource "aws_route53_record" "tfer--Z001446939YCN1F8RKCU0_geobit-002E-co-002E-id-002E-_MX_" {
  multivalue_answer_routing_policy = "false"
  name                             = "geobit.co.id"
  records                          = ["1 aspmx.l.google.com.", "10 alt3.aspmx.l.google.com.", "10 alt4.aspmx.l.google.com.", "5 alt1.aspmx.l.google.com.", "5 alt2.aspmx.l.google.com."]
  ttl                              = "1800"
  type                             = "MX"
  zone_id                          = "${aws_route53_zone.tfer--Z001446939YCN1F8RKCU0_geobit-002E-co-002E-id.zone_id}"
}

resource "aws_route53_record" "tfer--Z001446939YCN1F8RKCU0_geobit-002E-co-002E-id-002E-_NS_" {
  multivalue_answer_routing_policy = "false"
  name                             = "geobit.co.id"
  records                          = ["ns-1394.awsdns-46.org.", "ns-1546.awsdns-01.co.uk.", "ns-461.awsdns-57.com.", "ns-754.awsdns-30.net."]
  ttl                              = "1800"
  type                             = "NS"
  zone_id                          = "${aws_route53_zone.tfer--Z001446939YCN1F8RKCU0_geobit-002E-co-002E-id.zone_id}"
}

resource "aws_route53_record" "tfer--Z001446939YCN1F8RKCU0_geobit-002E-co-002E-id-002E-_SOA_" {
  multivalue_answer_routing_policy = "false"
  name                             = "geobit.co.id"
  records                          = ["ns-754.awsdns-30.net. awsdns-hostmaster.amazon.com. 1 7200 900 1209600 86400"]
  ttl                              = "900"
  type                             = "SOA"
  zone_id                          = "${aws_route53_zone.tfer--Z001446939YCN1F8RKCU0_geobit-002E-co-002E-id.zone_id}"
}

resource "aws_route53_record" "tfer--Z001446939YCN1F8RKCU0_geobit-002E-co-002E-id-002E-_TXT_" {
  multivalue_answer_routing_policy = "false"
  name                             = "geobit.co.id"
  records                          = ["google-site-verification=Nlgl-1IQSefXeWeorzf8NsiNR_mSnlaVQGOx2irpp9Q"]
  ttl                              = "1800"
  type                             = "TXT"
  zone_id                          = "${aws_route53_zone.tfer--Z001446939YCN1F8RKCU0_geobit-002E-co-002E-id.zone_id}"
}

resource "aws_route53_record" "tfer--Z001446939YCN1F8RKCU0_hivqsggxdnvn4u6kuqrw3vkdwhx6vnsh-002E-_domainkey-002E-geobit-002E-co-002E-id-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "hivqsggxdnvn4u6kuqrw3vkdwhx6vnsh._domainkey.geobit.co.id"
  records                          = ["hivqsggxdnvn4u6kuqrw3vkdwhx6vnsh.dkim.amazonses.com"]
  ttl                              = "1800"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--Z001446939YCN1F8RKCU0_geobit-002E-co-002E-id.zone_id}"
}

resource "aws_route53_record" "tfer--Z001446939YCN1F8RKCU0_jcrcc25e4xufkv2pilsdkl36pjwnrany-002E-_domainkey-002E-geobit-002E-co-002E-id-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "jcrcc25e4xufkv2pilsdkl36pjwnrany._domainkey.geobit.co.id"
  records                          = ["jcrcc25e4xufkv2pilsdkl36pjwnrany.dkim.amazonses.com"]
  ttl                              = "1800"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--Z001446939YCN1F8RKCU0_geobit-002E-co-002E-id.zone_id}"
}

resource "aws_route53_record" "tfer--Z001446939YCN1F8RKCU0_www-002E-geobit-002E-co-002E-id-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "www.geobit.co.id"
  records                          = ["geobit.co.id."]
  ttl                              = "1800"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--Z001446939YCN1F8RKCU0_geobit-002E-co-002E-id.zone_id}"
}

resource "aws_route53_record" "tfer--Z001446939YCN1F8RKCU0_zjnrhrtd7wsu4c7diupqg3jwftlr2g5e-002E-_domainkey-002E-geobit-002E-co-002E-id-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "zjnrhrtd7wsu4c7diupqg3jwftlr2g5e._domainkey.geobit.co.id"
  records                          = ["zjnrhrtd7wsu4c7diupqg3jwftlr2g5e.dkim.amazonses.com"]
  ttl                              = "1800"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--Z001446939YCN1F8RKCU0_geobit-002E-co-002E-id.zone_id}"
}

resource "aws_route53_record" "tfer--Z02028612M28TZP8E8V0T__amazonses-002E-wallsindonesia-safety-002E-com-002E-_TXT_" {
  multivalue_answer_routing_policy = "false"
  name                             = "_amazonses.wallsindonesia-safety.com"
  records                          = ["Wus9tj86AXepc2Gs+8YQOeprKggZDGoUtYxG4rG4UtM="]
  ttl                              = "1800"
  type                             = "TXT"
  zone_id                          = "${aws_route53_zone.tfer--Z02028612M28TZP8E8V0T_wallsindonesia-safety-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--Z02028612M28TZP8E8V0T_jzqfyrw27rjyvwekyu7tln6dae35xchr-002E-_domainkey-002E-wallsindonesia-safety-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "jzqfyrw27rjyvwekyu7tln6dae35xchr._domainkey.wallsindonesia-safety.com"
  records                          = ["jzqfyrw27rjyvwekyu7tln6dae35xchr.dkim.amazonses.com"]
  ttl                              = "1800"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--Z02028612M28TZP8E8V0T_wallsindonesia-safety-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--Z02028612M28TZP8E8V0T_notifications-002E-wallsindonesia-safety-002E-com-002E-_MX_" {
  multivalue_answer_routing_policy = "false"
  name                             = "notifications.wallsindonesia-safety.com"
  records                          = ["10 feedback-smtp.ap-southeast-1.amazonses.com"]
  ttl                              = "300"
  type                             = "MX"
  zone_id                          = "${aws_route53_zone.tfer--Z02028612M28TZP8E8V0T_wallsindonesia-safety-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--Z02028612M28TZP8E8V0T_notifications-002E-wallsindonesia-safety-002E-com-002E-_TXT_" {
  multivalue_answer_routing_policy = "false"
  name                             = "notifications.wallsindonesia-safety.com"
  records                          = ["v=spf1 include:amazonses.com ~all"]
  ttl                              = "300"
  type                             = "TXT"
  zone_id                          = "${aws_route53_zone.tfer--Z02028612M28TZP8E8V0T_wallsindonesia-safety-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--Z02028612M28TZP8E8V0T_u7zwjzmgsjn4kkhm5um2fvcgiy2iet4p-002E-_domainkey-002E-wallsindonesia-safety-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "u7zwjzmgsjn4kkhm5um2fvcgiy2iet4p._domainkey.wallsindonesia-safety.com"
  records                          = ["u7zwjzmgsjn4kkhm5um2fvcgiy2iet4p.dkim.amazonses.com"]
  ttl                              = "1800"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--Z02028612M28TZP8E8V0T_wallsindonesia-safety-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--Z02028612M28TZP8E8V0T_wallsindonesia-safety-002E-com-002E-_A_" {
  multivalue_answer_routing_policy = "false"
  name                             = "wallsindonesia-safety.com"
  records                          = ["54.254.17.101"]
  ttl                              = "1800"
  type                             = "A"
  zone_id                          = "${aws_route53_zone.tfer--Z02028612M28TZP8E8V0T_wallsindonesia-safety-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--Z02028612M28TZP8E8V0T_wallsindonesia-safety-002E-com-002E-_NS_" {
  multivalue_answer_routing_policy = "false"
  name                             = "wallsindonesia-safety.com"
  records                          = ["ns-1448.awsdns-53.org.", "ns-1928.awsdns-49.co.uk.", "ns-328.awsdns-41.com.", "ns-705.awsdns-24.net."]
  ttl                              = "172800"
  type                             = "NS"
  zone_id                          = "${aws_route53_zone.tfer--Z02028612M28TZP8E8V0T_wallsindonesia-safety-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--Z02028612M28TZP8E8V0T_wallsindonesia-safety-002E-com-002E-_SOA_" {
  multivalue_answer_routing_policy = "false"
  name                             = "wallsindonesia-safety.com"
  records                          = ["ns-328.awsdns-41.com. awsdns-hostmaster.amazon.com. 1 7200 900 1209600 86400"]
  ttl                              = "900"
  type                             = "SOA"
  zone_id                          = "${aws_route53_zone.tfer--Z02028612M28TZP8E8V0T_wallsindonesia-safety-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--Z02028612M28TZP8E8V0T_www-002E-wallsindonesia-safety-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "www.wallsindonesia-safety.com"
  records                          = ["wallsindonesia-safety.com"]
  ttl                              = "1800"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--Z02028612M28TZP8E8V0T_wallsindonesia-safety-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--Z02028612M28TZP8E8V0T_yl7nqn3hsco4wgytd5nx7mbosx3mznqn-002E-_domainkey-002E-wallsindonesia-safety-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "yl7nqn3hsco4wgytd5nx7mbosx3mznqn._domainkey.wallsindonesia-safety.com"
  records                          = ["yl7nqn3hsco4wgytd5nx7mbosx3mznqn.dkim.amazonses.com"]
  ttl                              = "1800"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--Z02028612M28TZP8E8V0T_wallsindonesia-safety-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--Z0255393V2YTF9F6QQ2E_7isfkpvoyaarcsjjmu4ahnak6caaiyh4-002E-_domainkey-002E-ptw-unioleo-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "7isfkpvoyaarcsjjmu4ahnak6caaiyh4._domainkey.ptw-unioleo.com"
  records                          = ["7isfkpvoyaarcsjjmu4ahnak6caaiyh4.dkim.amazonses.com"]
  ttl                              = "1800"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--Z0255393V2YTF9F6QQ2E_ptw-unioleo-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--Z0255393V2YTF9F6QQ2E__dmarc-002E-ptw-unioleo-002E-com-002E-_TXT_" {
  multivalue_answer_routing_policy = "false"
  name                             = "_dmarc.ptw-unioleo.com"
  records                          = ["v=DMARC1; p=none;"]
  ttl                              = "300"
  type                             = "TXT"
  zone_id                          = "${aws_route53_zone.tfer--Z0255393V2YTF9F6QQ2E_ptw-unioleo-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--Z0255393V2YTF9F6QQ2E_gyegpgjvv446a23u36obguueuustkt3p-002E-_domainkey-002E-ptw-unioleo-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "gyegpgjvv446a23u36obguueuustkt3p._domainkey.ptw-unioleo.com"
  records                          = ["gyegpgjvv446a23u36obguueuustkt3p.dkim.amazonses.com"]
  ttl                              = "1800"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--Z0255393V2YTF9F6QQ2E_ptw-unioleo-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--Z0255393V2YTF9F6QQ2E_notifications-002E-ptw-unioleo-002E-com-002E-_MX_" {
  multivalue_answer_routing_policy = "false"
  name                             = "notifications.ptw-unioleo.com"
  records                          = ["10 feedback-smtp.ap-southeast-1.amazonses.com"]
  ttl                              = "300"
  type                             = "MX"
  zone_id                          = "${aws_route53_zone.tfer--Z0255393V2YTF9F6QQ2E_ptw-unioleo-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--Z0255393V2YTF9F6QQ2E_notifications-002E-ptw-unioleo-002E-com-002E-_TXT_" {
  multivalue_answer_routing_policy = "false"
  name                             = "notifications.ptw-unioleo.com"
  records                          = ["v=spf1 include:amazonses.com ~all"]
  ttl                              = "300"
  type                             = "TXT"
  zone_id                          = "${aws_route53_zone.tfer--Z0255393V2YTF9F6QQ2E_ptw-unioleo-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--Z0255393V2YTF9F6QQ2E_ptw-unioleo-002E-com-002E-_A_" {
  multivalue_answer_routing_policy = "false"
  name                             = "ptw-unioleo.com"
  records                          = ["20.6.96.176"]
  ttl                              = "300"
  type                             = "A"
  zone_id                          = "${aws_route53_zone.tfer--Z0255393V2YTF9F6QQ2E_ptw-unioleo-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--Z0255393V2YTF9F6QQ2E_ptw-unioleo-002E-com-002E-_NS_" {
  multivalue_answer_routing_policy = "false"
  name                             = "ptw-unioleo.com"
  records                          = ["ns-1418.awsdns-49.org.", "ns-171.awsdns-21.com.", "ns-1770.awsdns-29.co.uk.", "ns-736.awsdns-28.net."]
  ttl                              = "172800"
  type                             = "NS"
  zone_id                          = "${aws_route53_zone.tfer--Z0255393V2YTF9F6QQ2E_ptw-unioleo-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--Z0255393V2YTF9F6QQ2E_ptw-unioleo-002E-com-002E-_SOA_" {
  multivalue_answer_routing_policy = "false"
  name                             = "ptw-unioleo.com"
  records                          = ["ns-1770.awsdns-29.co.uk. awsdns-hostmaster.amazon.com. 1 7200 900 1209600 86400"]
  ttl                              = "900"
  type                             = "SOA"
  zone_id                          = "${aws_route53_zone.tfer--Z0255393V2YTF9F6QQ2E_ptw-unioleo-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--Z0255393V2YTF9F6QQ2E_tdpuecvs35tovfwbz2ornh5zbubn7emv-002E-_domainkey-002E-ptw-unioleo-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "tdpuecvs35tovfwbz2ornh5zbubn7emv._domainkey.ptw-unioleo.com"
  records                          = ["tdpuecvs35tovfwbz2ornh5zbubn7emv.dkim.amazonses.com"]
  ttl                              = "1800"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--Z0255393V2YTF9F6QQ2E_ptw-unioleo-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--Z0538434KI9IR8PPENJO_gbvirt-002E-net-002E-_A_" {
  multivalue_answer_routing_policy = "false"
  name                             = "gbvirt.net"
  records                          = ["52.220.51.52"]
  ttl                              = "300"
  type                             = "A"
  zone_id                          = "${aws_route53_zone.tfer--Z0538434KI9IR8PPENJO_gbvirt-002E-net.zone_id}"
}

resource "aws_route53_record" "tfer--Z0538434KI9IR8PPENJO_gbvirt-002E-net-002E-_NS_" {
  multivalue_answer_routing_policy = "false"
  name                             = "gbvirt.net"
  records                          = ["ns-1486.awsdns-57.org.", "ns-1634.awsdns-12.co.uk.", "ns-23.awsdns-02.com.", "ns-680.awsdns-21.net."]
  ttl                              = "172800"
  type                             = "NS"
  zone_id                          = "${aws_route53_zone.tfer--Z0538434KI9IR8PPENJO_gbvirt-002E-net.zone_id}"
}

resource "aws_route53_record" "tfer--Z0538434KI9IR8PPENJO_gbvirt-002E-net-002E-_SOA_" {
  multivalue_answer_routing_policy = "false"
  name                             = "gbvirt.net"
  records                          = ["ns-1486.awsdns-57.org. awsdns-hostmaster.amazon.com. 1 7200 900 1209600 86400"]
  ttl                              = "900"
  type                             = "SOA"
  zone_id                          = "${aws_route53_zone.tfer--Z0538434KI9IR8PPENJO_gbvirt-002E-net.zone_id}"
}

resource "aws_route53_record" "tfer--Z05471702CK7IC0O0MQTO_bhfxdi5qg5engm2atpczo3eqxjtq2caj-002E-_domainkey-002E-nutrition-safety-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "bhfxdi5qg5engm2atpczo3eqxjtq2caj._domainkey.nutrition-safety.com"
  records                          = ["bhfxdi5qg5engm2atpczo3eqxjtq2caj.dkim.amazonses.com"]
  ttl                              = "1800"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--Z05471702CK7IC0O0MQTO_nutrition-safety-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--Z05471702CK7IC0O0MQTO_notifications-002E-nutrition-safety-002E-com-002E-_MX_" {
  multivalue_answer_routing_policy = "false"
  name                             = "notifications.nutrition-safety.com"
  records                          = ["10 feedback-smtp.ap-southeast-1.amazonses.com"]
  ttl                              = "300"
  type                             = "MX"
  zone_id                          = "${aws_route53_zone.tfer--Z05471702CK7IC0O0MQTO_nutrition-safety-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--Z05471702CK7IC0O0MQTO_notifications-002E-nutrition-safety-002E-com-002E-_TXT_" {
  multivalue_answer_routing_policy = "false"
  name                             = "notifications.nutrition-safety.com"
  records                          = ["v=spf1 include:amazonses.com ~all"]
  ttl                              = "300"
  type                             = "TXT"
  zone_id                          = "${aws_route53_zone.tfer--Z05471702CK7IC0O0MQTO_nutrition-safety-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--Z05471702CK7IC0O0MQTO_nutrition-safety-002E-com-002E-_A_" {
  multivalue_answer_routing_policy = "false"
  name                             = "nutrition-safety.com"
  records                          = ["52.220.47.245"]
  ttl                              = "1800"
  type                             = "A"
  zone_id                          = "${aws_route53_zone.tfer--Z05471702CK7IC0O0MQTO_nutrition-safety-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--Z05471702CK7IC0O0MQTO_nutrition-safety-002E-com-002E-_NS_" {
  multivalue_answer_routing_policy = "false"
  name                             = "nutrition-safety.com"
  records                          = ["ns-1188.awsdns-20.org.", "ns-2029.awsdns-61.co.uk.", "ns-21.awsdns-02.com.", "ns-865.awsdns-44.net."]
  ttl                              = "172800"
  type                             = "NS"
  zone_id                          = "${aws_route53_zone.tfer--Z05471702CK7IC0O0MQTO_nutrition-safety-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--Z05471702CK7IC0O0MQTO_nutrition-safety-002E-com-002E-_SOA_" {
  multivalue_answer_routing_policy = "false"
  name                             = "nutrition-safety.com"
  records                          = ["ns-2029.awsdns-61.co.uk. awsdns-hostmaster.amazon.com. 1 7200 900 1209600 86400"]
  ttl                              = "900"
  type                             = "SOA"
  zone_id                          = "${aws_route53_zone.tfer--Z05471702CK7IC0O0MQTO_nutrition-safety-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--Z05471702CK7IC0O0MQTO_ry6ntiw2t2wa5lglqzakfsnpfmrwimvl-002E-_domainkey-002E-nutrition-safety-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "ry6ntiw2t2wa5lglqzakfsnpfmrwimvl._domainkey.nutrition-safety.com"
  records                          = ["ry6ntiw2t2wa5lglqzakfsnpfmrwimvl.dkim.amazonses.com"]
  ttl                              = "1800"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--Z05471702CK7IC0O0MQTO_nutrition-safety-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--Z05471702CK7IC0O0MQTO_thiscbkdqz3awaqn2yl662yeqq5m26ff-002E-_domainkey-002E-nutrition-safety-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "thiscbkdqz3awaqn2yl662yeqq5m26ff._domainkey.nutrition-safety.com"
  records                          = ["thiscbkdqz3awaqn2yl662yeqq5m26ff.dkim.amazonses.com"]
  ttl                              = "1800"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--Z05471702CK7IC0O0MQTO_nutrition-safety-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--Z06497582O5QB24R70OC6_7s4kpxaufrww4vrzrf32px4pmglgoqns-002E-_domainkey-002E-wallsindonesia-engineering-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "7s4kpxaufrww4vrzrf32px4pmglgoqns._domainkey.wallsindonesia-engineering.com"
  records                          = ["7s4kpxaufrww4vrzrf32px4pmglgoqns.dkim.amazonses.com"]
  ttl                              = "1800"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--Z06497582O5QB24R70OC6_wallsindonesia-engineering-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--Z06497582O5QB24R70OC6__dmarc-002E-wallsindonesia-engineering-002E-com-002E-_TXT_" {
  multivalue_answer_routing_policy = "false"
  name                             = "_dmarc.wallsindonesia-engineering.com"
  records                          = ["v=DMARC1; p=reject"]
  ttl                              = "300"
  type                             = "TXT"
  zone_id                          = "${aws_route53_zone.tfer--Z06497582O5QB24R70OC6_wallsindonesia-engineering-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--Z06497582O5QB24R70OC6_avarskqembpqa2qxrrfeeikceta7rxpo-002E-_domainkey-002E-wallsindonesia-engineering-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "avarskqembpqa2qxrrfeeikceta7rxpo._domainkey.wallsindonesia-engineering.com"
  records                          = ["avarskqembpqa2qxrrfeeikceta7rxpo.dkim.amazonses.com"]
  ttl                              = "1800"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--Z06497582O5QB24R70OC6_wallsindonesia-engineering-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--Z06497582O5QB24R70OC6_digibox-002E-wallsindonesia-engineering-002E-com-002E-_A_" {
  multivalue_answer_routing_policy = "false"
  name                             = "digibox.wallsindonesia-engineering.com"
  records                          = ["54.255.67.102"]
  ttl                              = "300"
  type                             = "A"
  zone_id                          = "${aws_route53_zone.tfer--Z06497582O5QB24R70OC6_wallsindonesia-engineering-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--Z06497582O5QB24R70OC6_legacy-002E-wallsindonesia-engineering-002E-com-002E-_A_" {
  multivalue_answer_routing_policy = "false"
  name                             = "legacy.wallsindonesia-engineering.com"
  records                          = ["54.255.67.102"]
  ttl                              = "300"
  type                             = "A"
  zone_id                          = "${aws_route53_zone.tfer--Z06497582O5QB24R70OC6_wallsindonesia-engineering-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--Z06497582O5QB24R70OC6_mirror-002E-wallsindonesia-engineering-002E-com-002E-_A_" {
  multivalue_answer_routing_policy = "false"
  name                             = "mirror.wallsindonesia-engineering.com"
  records                          = ["54.255.67.102"]
  ttl                              = "300"
  type                             = "A"
  zone_id                          = "${aws_route53_zone.tfer--Z06497582O5QB24R70OC6_wallsindonesia-engineering-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--Z06497582O5QB24R70OC6_notifications-002E-wallsindonesia-engineering-002E-com-002E-_MX_" {
  multivalue_answer_routing_policy = "false"
  name                             = "notifications.wallsindonesia-engineering.com"
  records                          = ["10 feedback-smtp.ap-southeast-1.amazonses.com"]
  ttl                              = "300"
  type                             = "MX"
  zone_id                          = "${aws_route53_zone.tfer--Z06497582O5QB24R70OC6_wallsindonesia-engineering-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--Z06497582O5QB24R70OC6_notifications-002E-wallsindonesia-engineering-002E-com-002E-_TXT_" {
  multivalue_answer_routing_policy = "false"
  name                             = "notifications.wallsindonesia-engineering.com"
  records                          = ["v=spf1 include:amazonses.com ~all"]
  ttl                              = "300"
  type                             = "TXT"
  zone_id                          = "${aws_route53_zone.tfer--Z06497582O5QB24R70OC6_wallsindonesia-engineering-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--Z06497582O5QB24R70OC6_wallsindonesia-engineering-002E-com-002E-_A_" {
  multivalue_answer_routing_policy = "false"
  name                             = "wallsindonesia-engineering.com"
  records                          = ["54.255.67.102"]
  ttl                              = "300"
  type                             = "A"
  zone_id                          = "${aws_route53_zone.tfer--Z06497582O5QB24R70OC6_wallsindonesia-engineering-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--Z06497582O5QB24R70OC6_wallsindonesia-engineering-002E-com-002E-_NS_" {
  multivalue_answer_routing_policy = "false"
  name                             = "wallsindonesia-engineering.com"
  records                          = ["ns-1307.awsdns-35.org.", "ns-1623.awsdns-10.co.uk.", "ns-480.awsdns-60.com.", "ns-899.awsdns-48.net."]
  ttl                              = "172800"
  type                             = "NS"
  zone_id                          = "${aws_route53_zone.tfer--Z06497582O5QB24R70OC6_wallsindonesia-engineering-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--Z06497582O5QB24R70OC6_wallsindonesia-engineering-002E-com-002E-_SOA_" {
  multivalue_answer_routing_policy = "false"
  name                             = "wallsindonesia-engineering.com"
  records                          = ["ns-480.awsdns-60.com. awsdns-hostmaster.amazon.com. 1 7200 900 1209600 86400"]
  ttl                              = "900"
  type                             = "SOA"
  zone_id                          = "${aws_route53_zone.tfer--Z06497582O5QB24R70OC6_wallsindonesia-engineering-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--Z06497582O5QB24R70OC6_www-002E-wallsindonesia-engineering-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "www.wallsindonesia-engineering.com"
  records                          = ["wallsindonesia-engineering.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--Z06497582O5QB24R70OC6_wallsindonesia-engineering-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--Z06497582O5QB24R70OC6_y56vpju3hpf55g4tj733djmw6gj4oh6b-002E-_domainkey-002E-wallsindonesia-engineering-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "y56vpju3hpf55g4tj733djmw6gj4oh6b._domainkey.wallsindonesia-engineering.com"
  records                          = ["y56vpju3hpf55g4tj733djmw6gj4oh6b.dkim.amazonses.com"]
  ttl                              = "1800"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--Z06497582O5QB24R70OC6_wallsindonesia-engineering-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--Z06895933PVG4VL3E2DVV_petroturbo-iot-002E-com-002E-_A_" {
  multivalue_answer_routing_policy = "false"
  name                             = "petroturbo-iot.com"
  records                          = ["18.136.182.96"]
  ttl                              = "300"
  type                             = "A"
  zone_id                          = "${aws_route53_zone.tfer--Z06895933PVG4VL3E2DVV_petroturbo-iot-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--Z06895933PVG4VL3E2DVV_petroturbo-iot-002E-com-002E-_NS_" {
  multivalue_answer_routing_policy = "false"
  name                             = "petroturbo-iot.com"
  records                          = ["ns-1364.awsdns-42.org.", "ns-1803.awsdns-33.co.uk.", "ns-400.awsdns-50.com.", "ns-592.awsdns-10.net."]
  ttl                              = "172800"
  type                             = "NS"
  zone_id                          = "${aws_route53_zone.tfer--Z06895933PVG4VL3E2DVV_petroturbo-iot-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--Z06895933PVG4VL3E2DVV_petroturbo-iot-002E-com-002E-_SOA_" {
  multivalue_answer_routing_policy = "false"
  name                             = "petroturbo-iot.com"
  records                          = ["ns-592.awsdns-10.net. awsdns-hostmaster.amazon.com. 1 7200 900 1209600 86400"]
  ttl                              = "900"
  type                             = "SOA"
  zone_id                          = "${aws_route53_zone.tfer--Z06895933PVG4VL3E2DVV_petroturbo-iot-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--Z0975781256X79397TGAP_she-homecareid-002E-com-002E-_A_" {
  multivalue_answer_routing_policy = "false"
  name                             = "she-homecareid.com"
  records                          = ["52.220.47.245"]
  ttl                              = "1800"
  type                             = "A"
  zone_id                          = "${aws_route53_zone.tfer--Z0975781256X79397TGAP_she-homecareid-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--Z0975781256X79397TGAP_she-homecareid-002E-com-002E-_NS_" {
  multivalue_answer_routing_policy = "false"
  name                             = "she-homecareid.com"
  records                          = ["ns-1473.awsdns-56.org.", "ns-1867.awsdns-41.co.uk.", "ns-226.awsdns-28.com.", "ns-721.awsdns-26.net."]
  ttl                              = "172800"
  type                             = "NS"
  zone_id                          = "${aws_route53_zone.tfer--Z0975781256X79397TGAP_she-homecareid-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--Z0975781256X79397TGAP_she-homecareid-002E-com-002E-_SOA_" {
  multivalue_answer_routing_policy = "false"
  name                             = "she-homecareid.com"
  records                          = ["ns-721.awsdns-26.net. awsdns-hostmaster.amazon.com. 1 7200 900 1209600 86400"]
  ttl                              = "900"
  type                             = "SOA"
  zone_id                          = "${aws_route53_zone.tfer--Z0975781256X79397TGAP_she-homecareid-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--Z1034299210PWZBYLGFY4_ctvpnzn6tc5c5iqfw76runp67wytai4y-002E-_domainkey-002E-jastekindo-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "ctvpnzn6tc5c5iqfw76runp67wytai4y._domainkey.jastekindo.com"
  records                          = ["ctvpnzn6tc5c5iqfw76runp67wytai4y.dkim.amazonses.com"]
  ttl                              = "1800"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--Z1034299210PWZBYLGFY4_jastekindo-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--Z1034299210PWZBYLGFY4_fo7k73j4jlh52udyzhhn3hsm2cg5szar-002E-_domainkey-002E-jastekindo-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "fo7k73j4jlh52udyzhhn3hsm2cg5szar._domainkey.jastekindo.com"
  records                          = ["fo7k73j4jlh52udyzhhn3hsm2cg5szar.dkim.amazonses.com"]
  ttl                              = "1800"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--Z1034299210PWZBYLGFY4_jastekindo-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--Z1034299210PWZBYLGFY4_jastekindo-002E-com-002E-_A_" {
  multivalue_answer_routing_policy = "false"
  name                             = "jastekindo.com"
  records                          = ["3.1.35.219"]
  ttl                              = "1800"
  type                             = "A"
  zone_id                          = "${aws_route53_zone.tfer--Z1034299210PWZBYLGFY4_jastekindo-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--Z1034299210PWZBYLGFY4_jastekindo-002E-com-002E-_NS_" {
  multivalue_answer_routing_policy = "false"
  name                             = "jastekindo.com"
  records                          = ["ns-1267.awsdns-30.org.", "ns-1724.awsdns-23.co.uk.", "ns-452.awsdns-56.com.", "ns-560.awsdns-06.net."]
  ttl                              = "172800"
  type                             = "NS"
  zone_id                          = "${aws_route53_zone.tfer--Z1034299210PWZBYLGFY4_jastekindo-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--Z1034299210PWZBYLGFY4_jastekindo-002E-com-002E-_SOA_" {
  multivalue_answer_routing_policy = "false"
  name                             = "jastekindo.com"
  records                          = ["ns-560.awsdns-06.net. awsdns-hostmaster.amazon.com. 1 7200 900 1209600 86400"]
  ttl                              = "900"
  type                             = "SOA"
  zone_id                          = "${aws_route53_zone.tfer--Z1034299210PWZBYLGFY4_jastekindo-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--Z1034299210PWZBYLGFY4_mailer-002E-jastekindo-002E-com-002E-_MX_" {
  multivalue_answer_routing_policy = "false"
  name                             = "mailer.jastekindo.com"
  records                          = ["10 feedback-smtp.ap-southeast-1.amazonses.com"]
  ttl                              = "300"
  type                             = "MX"
  zone_id                          = "${aws_route53_zone.tfer--Z1034299210PWZBYLGFY4_jastekindo-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--Z1034299210PWZBYLGFY4_mailer-002E-jastekindo-002E-com-002E-_TXT_" {
  multivalue_answer_routing_policy = "false"
  name                             = "mailer.jastekindo.com"
  records                          = ["v=spf1 include:amazonses.com ~all"]
  ttl                              = "300"
  type                             = "TXT"
  zone_id                          = "${aws_route53_zone.tfer--Z1034299210PWZBYLGFY4_jastekindo-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--Z1034299210PWZBYLGFY4_q37znoqat5catz5u3mpccazogtzhwyfd-002E-_domainkey-002E-jastekindo-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "q37znoqat5catz5u3mpccazogtzhwyfd._domainkey.jastekindo.com"
  records                          = ["q37znoqat5catz5u3mpccazogtzhwyfd.dkim.amazonses.com"]
  ttl                              = "1800"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--Z1034299210PWZBYLGFY4_jastekindo-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--Z1034299210PWZBYLGFY4_www-002E-jastekindo-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "www.jastekindo.com"
  records                          = ["jastekindo.com"]
  ttl                              = "1800"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--Z1034299210PWZBYLGFY4_jastekindo-002E-com.zone_id}"
}
