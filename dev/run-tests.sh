#!/bin/bash
set -e

WORKDIR=$(realpath "$(dirname "$0")")
REPO_DIR=$(realpath "${WORKDIR[*]}/../")
echo "WORKDIR ${WORKDIR}"
echo "REPO_DIR ${REPO_DIR}"

for chart in $REPO_DIR/charts/*/; do
  echo "chart $chart"
  helm template test $chart -f $chart/tests/template-all/values-full.yaml 1> /dev/null

  echo "unittest $chart"
  time helm unittest $chart --helm3
done
