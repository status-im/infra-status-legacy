module "node" {
  source = "github.com/status-im/infra-tf-multi-provider"

  /* node type */
  group  = "status"
  env    = local.ws.env
  stage  = local.ws.stage
  domain = var.domain

  /* scaling */
  host_count = local.ws["node_count"]

  /* instance sizes */
  do_type = local.ws["node_do_type"] /* DigitalOcean */
  ac_type = local.ws["node_ac_type"] /* Alibaba Cloud */
  gc_type = local.ws["node_gc_type"] /* Google Cloud */

  /* data volumes */
  ac_data_vol_size = local.ws["node_data_vol_size"]
  do_data_vol_size = local.ws["node_data_vol_size"]
  gc_data_vol_size = local.ws["node_data_vol_size"]

  /* fix for volume size */
  ac_data_vol_type = local.ws["node_ac_data_vol_type"]

  /* firewall */
  open_tcp_ports = [
    "30303", /* p2p main */
    "443",   /* websocket */
    "80",    /* certbot */
  ]
  open_udp_ports = [
    "9000",  /* discovery v5 */
  ]
}