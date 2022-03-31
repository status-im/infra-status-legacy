module "hosts" {
  source = "github.com/status-im/infra-tf-multi-provider"

  /* node type */
  group  = "status"
  env    = local.ws.env
  stage  = local.ws.stage
  domain = var.domain

  /* scaling */
  host_count = local.ws["hosts_count"]

  /* instance sizes */
  do_type = local.ws["do_type"] /* DigitalOcean */
  ac_type = local.ws["ac_type"] /* Alibaba Cloud */
  gc_type = local.ws["gc_type"] /* Google Cloud */

  /* firewall */
  open_tcp_ports = [ "30303" ] /* p2p main */
  open_udp_ports = [ "9000" ]  /* discovery v5 */
}
