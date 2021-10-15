resource "aws_route53_record" "route_dl" {
  zone_id = "${var.zone_id_route53}" #ID da zona hospedada
  name    = "${var.dns_aplicacao}"
  type    = "${var.route53_type}"

  alias {
    name                   = "${var.route_api_name}" #DNS LoadBalancer
    zone_id                = "${var.route_api_zone_id}" #Zona hospedada
    evaluate_target_health = true
  }
}
#Porta 3000
resource "aws_route53_record" "route_db_grafana" {
  zone_id = "${var.zone_id_route53}" 
  name    = "${var.dns_grafana}"
  type    = "${var.route53_type}"

  alias {
    name                   = "${var.route_grafana_name}" 
    zone_id                = "${var.route_grafana_zone_id}"
    evaluate_target_health = true
  }
}
#Porta 9093
resource "aws_route53_record" "route_dl_alertmanager" {
  zone_id = "${var.zone_id_route53}" 
  name    = "${var.dns_alertmanager}" 
  type    = "${var.route53_type}"

  alias {
    name                   = "${var.route_alertmanager_name}" 
    zone_id                = "${var.route_alertmanager_zone_id}" 
    evaluate_target_health = true
  }
}