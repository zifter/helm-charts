#!/bin/bash
set -e

WORKDIR=$(realpath "$(dirname "$0")")
REPO_DIR=$(realpath "${WORKDIR[*]}/../")
echo "WORKDIR ${WORKDIR}"
echo "REPO_DIR ${REPO_DIR}"

for chart in $REPO_DIR/charts/*/; do
  echo "chart $chart"
  time helm schema-gen $chart/tests/template-all/values-full.yaml > $chart/values.schema.json
done
