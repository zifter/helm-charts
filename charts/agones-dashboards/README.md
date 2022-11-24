# agones dashboards

## Usage
To install agones dashboards you need.

### Add helm repository
```bash
helm repo add zifter https://zifter.github.io/helm-charts/
```

### Install chart
Be aware, prometheus CRD must be installed before installing this chart.

Install chart with to specific namespace, where prometheus-operator will be able to discover rules,
service monitor and etc:
```bash
helm install agones-dashboards zifter/agones-dashboards --namespace monitoring
```
