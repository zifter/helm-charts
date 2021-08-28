#!/bin/bash
set -e

WORKDIR=$(realpath "$(dirname "$0")")
echo "WORKDIR ${WORKDIR}"

$WORKDIR/setup.sh
$WORKDIR/deploy.sh

curl http://localhost:1080/domain-exporter/metrics