#!/bin/bash

# Create a backup of the existing (presumably working) container
IMAGE_NAME="demo-shell"
OLD_TAG="latest"  # Change to whatever your usual image tag is
BACKUP_TAG="backup-$(date +%Y%m%d-%H%M%S)"  # Create a timestamp-based backup tag

# Tag the current image with a backup tag
docker tag "$IMAGE_NAME:$OLD_TAG" "$IMAGE_NAME:$BACKUP_TAG"

# Verify the tagging was successful
if docker images | grep "$IMAGE_NAME" | grep "$BACKUP_TAG"; then
  echo "Backup tag created: $IMAGE_NAME:$BACKUP_TAG"
else
  echo "Failed to create backup tag."
  exit 1
fi

# Get latest version of SOOS packages
[ -d "./soos" ] && rm -rf "./soos"
npm install --prefix ./soos @soos-io/soos-sca
npm install --prefix ./soos @soos-io/soos-sbom
npm install --prefix ./soos @soos-io/soos-sast

docker pull soosio/dast
docker pull soosio/csa

# Open a shell
bash
