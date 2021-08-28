#!/bin/bash
set -e

WORKDIR=$(realpath "$(dirname "$0")")
REPO_DIR=$(realpath "${WORKDIR[*]}/../../")
echo "WORKDIR ${WORKDIR}"
echo "REPO_DIR ${REPO_DIR}"

echo "========================"
echo "Install prometheus stack"
helm upgrade --install \
  prometheus-stack prometheus-community/kube-prometheus-stack \
  --version 18.0.1 \
  --create-namespace \
  --namespace monitoring \
  --wait \
  --timeout 120s \
  -f $WORKDIR/values-prometheus-stack.yaml

echo "==============================================="
echo "Install ingress to access from localhost easily"
helm upgrade --install \
  ingress-nginx ingress-nginx/ingress-nginx \
  --version 3.36.0 \
  --create-namespace \
  --namespace ingress-nginx \
  --wait \
  --timeout 60s \
  -f $WORKDIR/values-ingress-nginx.yaml \

echo "============================="
echo "Install domain exporter chart"
helm upgrade --install \
  domain-exporter ${REPO_DIR}/charts/domain-exporter \
  --namespace monitoring \
  --wait \
  --timeout 30s \
  -f $WORKDIR/values-domain-exporter.yaml

echo "==========================================================="
echo "Grafana:      http://localhost:1080/grafana (admin - admin)"
echo "Prometheus:   http://localhost:1080/prometheus"
echo "Alertmanager: http://localhost:1080/alertmanager"
echo "Metrics:      http://localhost:1080/domain-exporter/metrics"
echo "==========================================================="
