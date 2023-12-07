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
      node_ac_type = "ecs.t5-lc1m2.small" /* Alibaba Cloud */
      node_gc_type = "g1-small"           /* Google Cloud */
      node_ac_data_vol_type = "cloud_ssd"
      node_data_vol_size = 40 /* TODO Remove in favor of DB hosts. */

      /* PostgreSQL */
      db_count     = 1
      db_do_type   = "s-1vcpu-2gb"        /* DigitalOcean */
      db_data_vol_size = 40
    }

    # Inherits defaults.
    test = {
      db_do_type   = "s-6vcpu-16gb"
    }
    prod = {
      node_count = 2
      node_data_vol_size = 350
      db_data_vol_size = 300
    }
  }
}

locals {
  ws = merge(local.env["defaults"], local.env[terraform.workspace])
}
