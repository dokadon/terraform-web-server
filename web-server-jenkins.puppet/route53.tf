data "aws_route53_zone" "selected" {
  name         = "${var.domain_name}"
  private_zone = false
}

resource "aws_route53_record" "jenkins" {
  zone_id = "${data.aws_route53_zone.selected.zone_id}"
  name    = "${var.server_name}.${data.aws_route53_zone.selected.name}"
  type    = "A"
  ttl     = "60"
  records = ["${aws_instance.jenkins.public_ip}"]
}
