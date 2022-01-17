# rq exporter

## Usage
To install rq-exporter you need.

### Add helm repository
```bash
helm repo add zifter https://zifter.github.io/helm-charts/
```

### Install chart
Be aware, prometheus CRD must be installed before installing this chart.

Install chart with necessary domains list to specific namespace, where prometheus-operator will be able to discover rules,
service monitor and etc:
```bash
helm install rq-exporter zifter/rq-exporter --namespace monitoring -f values-prod.yaml
```

where values-prod.yaml is:
```yaml
# rq to export metrics
rq:
  - name: rq
    host: localhost
    port: 6379
    index: 0
  - name: rq2
    host: second-host
```
