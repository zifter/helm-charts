#!/bin/bash
set -e

WORKDIR=$(realpath "$(dirname "$0")")
REPO_DIR=$(realpath "${WORKDIR[*]}/../../")
echo "WORKDIR ${WORKDIR}"
echo "REPO_DIR ${REPO_DIR}"

for values in $WORKDIR/*.yaml; do
  helm template $REPO_DIR/.helm -f $values 1> /dev/null
done