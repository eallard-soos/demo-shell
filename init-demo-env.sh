#!/bin/bash

# Ensure latest of SOOS packages
[ -d "./soos" ] && rm -rf "./soos"
npm install --prefix ./soos @soos-io/soos-sca
npm install --prefix ./soos @soos-io/soos-sbom
npm install --prefix ./soos @soos-io/soos-sast

docker pull soosio/dast
docker pull soosio/csa

# Open a shell for you to run further commands
bash