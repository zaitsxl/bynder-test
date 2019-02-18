data "aws_route53_zone" "default" {
    name = "${var.dns_zone}"
    private_zone = true
}

resource "aws_route53_record" "poc-loadbalancer" {
    zone_id = "${data.aws_route53_zone.default.zone_id}"
    name = "service.${var.aws_region}.${var.dns_zone}"
    type = "A"

    alias {
        name = "${aws_elb.poc-loadbalancer.dns_name}"
        zone_id = "${aws_elb.poc-loadbalancer.zone_id}"
        evaluate_target_health = true
    }

    depends_on = ["aws_elb.poc-loadbalancer"]
}

resource "aws_route53_record" "main" {
    zone_id = "${data.aws_route53_zone.default.zone_id}"
    name = "service.${var.dns_zone}"
    type = "CNAME"
    records = ["service.${var.aws_region}.${var.dns_zone}"]    

    latency_routing_policy {
         region = "${var.aws_region}"
    }

    depends_on = ["aws_route53_record.poc-loadbalancer"]
}
