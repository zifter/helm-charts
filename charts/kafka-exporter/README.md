# kafka exporter

## Usage
To install kafka-exporter you need.

### Add helm repository
```bash
helm repo add zifter https://zifter.github.io/helm-charts/
```

### Install chart
Be aware, prometheus CRD must be installed before installing this chart.

Install chart with necessary domains list to specific namespace, where prometheus-operator will be able to discover rules,
service monitor and etc:
```bash
helm install kafka-exporter zifter/kafka-exporter --namespace monitoring -f values-prod.yaml
```

where values-prod.yaml is:
```yaml
# Kafka clusters to export metrics
kafka:
  - name: kafka-cluster
    # if sasl is enabled provide user
    user: null
    # if sasl is enabled provide password
    password: null
    # list of brokers of cluster to monitor
    brokers:
      - host1:9092
      - host2:9092
  - name: kafka-cluster-sasl
    # if sasl is enabled provide user
    user: user
    # if sasl is enabled provide password
    password: pass
    # list of brokers of cluster to monitor
    brokers:
      - host1:9092
      - host2:9092
      - host2:9092

```
