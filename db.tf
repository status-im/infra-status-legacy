module "db" {
  source = "github.com/status-im/infra-tf-digital-ocean"

  /* node type */
  name   = "db"
  group  = "status-db"
  env    = local.ws.env
  stage  = local.ws.stage
  domain = var.domain

  /* scaling */
  type       = local.ws["db_do_type"]
  host_count = local.ws["db_count"]

  /* data volumes */
  data_vol_size = local.ws["db_data_vol_size"]
}
