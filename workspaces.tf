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

      /* scaling */
      hosts_count = 1
      data_volume_size = 40
      ac_data_volume_type = "cloud_ssd"
      do_type = "s-1vcpu-2gb"        /* DigitalOcean */
      ac_type = "ecs.t5-lc1m2.small" /* Alibaba Cloud */
      gc_type = "g1-small"           /* Google Cloud */
    }

    # Inherits defaults.
    test = { hosts_count = 1 }
    prod = {
      hosts_count = 2
      data_volume_size = 350
    }
  }
}

locals {
  ws = merge(local.env["defaults"], local.env[terraform.workspace])
}
