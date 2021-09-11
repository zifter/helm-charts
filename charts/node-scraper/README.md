# node metrics exporter

This tool export node metrics to prometheus

## Installation

Replace \<cluster name\> with actual value

```bash

helm upgrade --install \
             --debug \
             --create-namespace \
             -n monitoring \
             -f values-<cluster-name>.yaml \
             boh-node-exporter .
```
