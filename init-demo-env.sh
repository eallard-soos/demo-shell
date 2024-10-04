#!/bin/bash
# Ensure fresh installation of SOOS package
[ -d "./soos" ] && rm -rf "./soos"
npm install --prefix ./soos @soos-io/soos-sca

# Open a shell for you to run further commands
bash