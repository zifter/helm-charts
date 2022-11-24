# zookeeper exporter

## Usage
To install zookeeper-exporter you need.

### Add helm repository
```bash
helm repo add zifter https://zifter.github.io/helm-charts/
```

### Install chart
Be aware, prometheus CRD must be installed before installing this chart.

Install chart to specific namespace, where prometheus-operator will be able to discover rules,
service monitor and etc:
```bash
helm install zookeeper-exporter zifter/zookeeper-exporter --namespace monitoring -f values-prod.yaml
```

where values-prod.yaml is:
```yaml
# Zookeeper clusters to export metrics
zookeeper:
  - name: cluster1
    # list of hosts of cluster to monitor
    brokers:
      - host1:2181
      - host2:2181
  - name: cluster2
    # list of hosts of cluster to monitor
    hosts:
      - host1:2181
      - host2:2181
      - host2:2181
```
