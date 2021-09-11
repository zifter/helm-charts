# kafka exporter

## Usage
To install clickhouse-exporter you need.

### Add helm repository
```bash
helm repo add zifter https://zifter.github.io/helm-charts/
```

### Install chart
Be aware, prometheus CRD must be installed before installing this chart.

Install chart with necessary domains list to specific namespace, where prometheus-operator will be able to discover rules,
service monitor and etc:
```bash
helm install clickhouse-exporter zifter/clickhouse-exporter --namespace monitoring -f values-prod.yaml
```

where values-prod.yaml is:
```yaml
# Clickhouse clusters to export metrics
clickhouse:
  - name: cluster-name
    user: user
    password: pass
    hosts:
     - clickhouse-host-1
     - clickhouse-host-2
     - clickhouse-host-3
```
