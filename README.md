This repository is the chart of [lamp](https://github.com/kubesphere-sigs/lamp-cloud).

# Get started

## Dependencies
There're some components are required before we install lamp.

| Name | Description |
|---|---|
| `Nacos` | Need 1.4.0+ |
| `MySQL` |  |
| `Redis` |  |

## Install

```
helm install lamp . --set nacos.ip=139.198.9.251 --set nacos.port=30000 \
    --set nacos.id=be33b355-f879-4b4e-a5c6-338387cfa698 \
    --set service.type=NodePort
```

# Configuration

| Parameter | Description | Default |
|---|---|---|
| `nacos.ip` |  |  |
| `nacos.port` |  |  |
| `nacos.id` |  |  |
| `service.type` | | |
