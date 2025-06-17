#!/usr/bin/env bash
set -euo pipefail

IMAGE_NAME="demo-shell"
TIMESTAMP=$(date +%Y%m%d-%H%M%S)

############################################
# 1) Install / pull the latest SOOS tools
############################################
[ -d "./soos" ] && rm -rf "./soos"
npm install --prefix ./soos @soos-io/soos-sca
npm install --prefix ./soos @soos-io/soos-sbom
npm install --prefix ./soos @soos-io/soos-sast

docker pull soosio/dast
docker pull soosio/csa

############################################
# 2) Commit the *running* container
############################################
# This docker commit works because we mounted the host’s Docker socket when we launched the container
CONTAINER_ID=$(hostname)
SNAPSHOT_TAG="snapshot-${TIMESTAMP}"

docker commit "${CONTAINER_ID}" "${IMAGE_NAME}:${SNAPSHOT_TAG}"
echo "Snapshot saved as ${IMAGE_NAME}:${SNAPSHOT_TAG}"

############################################
# 3) Drop into an interactive shell
############################################
exec bash