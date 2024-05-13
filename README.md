# Description

This repo defines infrastructure for main [Status](http://status.im/) fleet running [nim-waku](https://github.com/waku-org/nwaku) nodes.

# Discovery

DNS `TXT` ENRTree records exist to discover available fleets:
```
enrtree://AIO6LUM3IVWCU2KCPBBI6FEH2W42IGK3ASCZHZGG5TIXUR56OGQUO@test.status.nodes.status.im
enrtree://AL65EKLJAUXKKPG43HVTML5EFFWEZ7L4LOKTLZCLJASG4DSESQZEC@prod.status.nodes.status.im
```

# Continuous Integration

Jenkins CI builds can be used to build and deploy new Docker images:

* `status.test` - https://ci.infra.status.im/job/nim-waku/job/deploy-status-test/
* `status.prod` - https://ci.infra.status.im/job/nim-waku/job/deploy-status-prod/

# Repo Usage

For how to use this repo read the [Infra Repo Usage](https://github.com/status-im/infra-docs/blob/master/docs/general/ansible_terraform.md) doc.
