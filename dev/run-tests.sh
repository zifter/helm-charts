#!/bin/bash
set -e

WORKDIR=$(realpath "$(dirname "$0")")
REPO_DIR=$(realpath "${WORKDIR[*]}/../")
echo "WORKDIR ${WORKDIR}"
echo "REPO_DIR ${REPO_DIR}"

for chart in $REPO_DIR/charts/*/; do
  echo "chart $chart"
  time $chart/tests/template-all/run.sh
done
