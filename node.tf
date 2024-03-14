module "node" {
  source = "github.com/status-im/infra-tf-multi-provider"

  /* node type */
  group  = "status-node"
  env    = local.ws.env
  stage  = local.ws.stage

  /* scaling */
  host_count = local.ws["node_count"]

  /* instance sizes */
  do_type = local.ws["node_do_type"] /* DigitalOcean */
  ac_type = local.ws["node_ac_type"] /* Alibaba Cloud */
  gc_type = local.ws["node_gc_type"] /* Google Cloud */

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
