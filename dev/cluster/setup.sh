#!/bin/bash
set -e

WORKDIR=$(realpath "$(dirname "$0")")
REPO_DIR=$(realpath "${WORKDIR[*]}/../../")
echo "WORKDIR ${WORKDIR}"
echo "REPO_DIR ${REPO_DIR}"

echo "Create kind cluster"
kind create cluster -v 1 --config $WORKDIR/kind-config.yaml
