#!/bin/bash
set -e

REPO_DIR=$(realpath "$(dirname "$0")")
echo "REPO_DIR ${REPO_DIR}"

for chart in $REPO_DIR/charts/*/; do
  echo "chart $chart"
  time $chart/tests/template-all/run.sh
done
