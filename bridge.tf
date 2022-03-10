module "bridge" {
  source = "github.com/status-im/infra-tf-digital-ocean"

  /* node type */
  name   = "bridge"
  env    = local.ws.env
  stage  = local.ws.stage
  group  = "bridge-${local.ws.env}-${local.ws.stage}"
  domain = var.domain

  /* scaling */
  host_count = 1
  type       = "s-1vcpu-2gb"

  /* firewall */
  open_tcp_ports = [
    "9000",  /* libp2p */
    "30303", /* devp2p */
  ]
}
