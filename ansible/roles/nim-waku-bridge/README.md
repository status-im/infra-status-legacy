# Description

This role configures `nim-waku` [bridge](https://github.com/status-im/nim-waku/blob/master/waku/common/config_bridge.nim) service which bridges messages from old Waku v1 fleet running `status-go`(`eth.test`, `eth.prod`) to the new Waku v2 fleets(`status.test`, `status.prod`).

# Configuration

Bare minimum would include:
```yaml
nim_waku_bridge_service_name: 'nim-waku-bridge'
nim_waku_bridge_cont_tag: 'deploy-bridge-test'
nim_waku_bridge_log_level: 'info'
nim_waku_bridge_v1_fleet_name: 'test'
# Secret
nim_waku_bridge_nodekey_v1: 'super-secret-v1-nodekey'
nim_waku_bridge_nodekey_v2: 'super-secret-v2-nodekey'
```

# Management

# Links

* https://github.com/status-im/infra-status/issues/4
* https://github.com/status-im/nim-waku/blob/master/docs/tutorial/bridge.md
