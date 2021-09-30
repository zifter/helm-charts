# zifter's helm charts

Add helm repository 

```bash
helm repo add zifter https://github.com/zifter/helm-charts
```

## List of charts in this repository
* [agones-dashboards](charts/agones-dashboards/README.md)
* [domain-exporter](charts/domain-exporter/README.md)
* [kafka-exporter](charts/kafka-exporter/README.md)
* [clickhouse-exporter](charts/clickhouse-exporter/README.md)
* [zookeeper-exporter](charts/zookeeper-exporter/README.md)

## List of usefull charts in other repository
* [prometheus-node-exporter](https://github.com/prometheus-community/helm-charts/tree/main/charts/prometheus-node-exporter) -
export metrics from node. Will be installed by default in prometheus stack. Also allows to you scrape metrics from nodes
out of kubernetes.

## Contributing
### Preparation
#### Install kind
[kind](https://github.com/kubernetes-sigs/kind) is a tool for running local Kubernetes clusters using Docker container "nodes". 
kind was primarily designed for testing Kubernetes itself, but may be used for local development or CI.

```bash
sudo wget "https://github.com/kubernetes-sigs/kind/releases/download/v0.11.1/kind-linux-amd64" -O /usr/bin/kind && sudo chmod +x /usr/bin/kind
```

#### Install helm
[helm](https://github.com/helm/helm) is a tool for managing Charts. Charts are packages of pre-configured Kubernetes resources.

```bash
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 && chmod 700 get_helm.sh && ./get_helm.sh --version v3.4.2 && rm -f ./get_helm.sh
```

#### Install helm plugin diff
[helm diff plugin] giving your a preview of what a helm upgrade would change. 

```bash
helm plugin install https://github.com/databus23/helm-diff --version 3.1.3
```

#### Install helmfile
[Helmfile](https://github.com/roboll/helmfile) is a declarative spec for deploying helm charts. 

```bash
sudo wget "https://github.com/roboll/helmfile/releases/download/v0.140.0/helmfile_linux_amd64" -O /usr/bin/helmfile && sudo chmod +x /usr/bin/helmfile
```

#### Install shcema-gen plugin 
Install [https://github.com/karuppiah7890/helm-schema-gen](helm-schema-gen) special plugin to generate schema

```bash
helm plugin install https://github.com/karuppiah7890/helm-schema-gen.git
```

### Launching test cluster with all dependencies
```bash
./dev/cluster/run.sh
```

### New Helm Chart Guide
* New chart in charts folder
* Add charts/*/tests/values-full,yaml
* Add to Dev Cluster installing this chart
* Add to README.md

### Testing helm charts
Install [ct](https://github.com/helm/chart-testing/releases)

Run linting of all helm charts
```bash
ct lint
```

### Generate values.schema.json
Run generation in particular chart folder
```bash
./dev/gen-values-schema.sh
```
