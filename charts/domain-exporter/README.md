# domain exporter

## Usage
To install domain-exporter you need:
Add helm repository 
```bash
helm repo add zifter-charts https://zifter.github.io/domain-exporter-helm/
```

Install chart with necessary domains list to specific namespace, where prometheus-operator will be able to discover rules, 
service monitor and etc: 
```bash
helm install domain-exporter zifter-charts/domain-exporter --namespace monitoring --set "domains={google.com,reddit.com,amazon.com}"
```

Be aware, prometheus CRD must be installed before installing this chart.
