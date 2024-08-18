resource "digitalocean_firewall" "chasiotis_firewall" {
  name        = var.firewall_configuration.name
  droplet_ids = [var.droplet_id]



  dynamic "inbound_rule" {
    for_each = var.firewall_configuration.ingress
    content {
      protocol         = inbound_rule.value["protocol"]
      source_addresses = inbound_rule.value["source_addresses"]
      port_range       = inbound_rule.value["port_range"]
    }
  }

  dynamic "outbound_rule" {
    for_each = var.firewall_configuration.egress
    content {
      protocol              = outbound_rule.value["protocol"]
      destination_addresses = outbound_rule.value["destination_addresses"]
      port_range            = outbound_rule.value["port_range"]
    }
  }


  inbound_rule {
    protocol         = "icmp"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }


  outbound_rule {
    protocol              = "icmp"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
}
