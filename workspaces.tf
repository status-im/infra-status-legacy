/**
 * This is a hacky way of binding specific variable
 * values to different Terraform workspaces.
 *
 * Details:
 * https://github.com/hashicorp/terraform/issues/15966
 */

locals {
  env = {
    defaults = {
      /* general */
      env   = "status"
      stage = terraform.workspace

      /* Waku nodes */
      node_count   = 1
      node_do_type = "s-1vcpu-2gb"        /* DigitalOcean */
      node_ac_type = "ecs.t5-lc1m2.small" /* AlibabaCloud */
      node_gc_type = "g1-small"           /* GoogleCloud  */

      /* PostgreSQL */
      db_count     = 1
      db_do_type   = "s-1vcpu-2gb"        /* DigitalOcean */
      db_ac_type   = "ecs.t5-lc1m2.small" /* AlibabaCloud */
      db_gc_type   = "g1-small"           /* GoogleCloud  */
      db_ac_data_vol_type = "cloud_ssd"
      db_data_vol_size = 100
    }

    # Inherits defaults.
    test = {}
    prod = {
      node_count = 2
      db_do_type = "s-2vcpu-4gb"
      db_ac_type = "ecs.sn1ne.large"
      db_gc_type = "c2d-highcpu-2"
      db_data_vol_size = 300
    }
  }
}

locals {
  ws = merge(local.env["defaults"], local.env[terraform.workspace])
}
