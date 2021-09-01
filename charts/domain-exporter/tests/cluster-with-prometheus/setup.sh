#!/bin/bash
set -e

WORKDIR=$(realpath "$(dirname "$0")")
REPO_DIR=$(realpath "${WORKDIR[*]}/../../")
echo "WORKDIR ${WORKDIR}"
echo "REPO_DIR ${REPO_DIR}"

echo "Create kind cluster"
kind create cluster -v 1 --config $WORKDIR/kind-config.yaml

echo "Add chart repo and update index"
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx --force-update
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
