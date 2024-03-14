module "db" {
  source = "github.com/status-im/infra-tf-multi-provider"

  /* node type */
  name   = "db"
  group  = "status-db"
  env    = local.ws.env
  stage  = local.ws.stage

  /* scaling */
  host_count = local.ws["db_count"]

  /* instance type */
  do_type    = local.ws["db_do_type"]
  ac_type    = local.ws["db_ac_type"]
  gc_type    = local.ws["db_gc_type"]

  /* data volumes */
  do_data_vol_size = local.ws["db_data_vol_size"]
  ac_data_vol_size = local.ws["db_data_vol_size"]
  gc_data_vol_size = local.ws["db_data_vol_size"]

  /* fix for volume size */
  ac_data_vol_type = local.ws["db_ac_data_vol_type"]
}
