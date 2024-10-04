# Use a lightweight Node.js image as the base
FROM node:18-alpine

# Install Docker CLI inside the container
RUN apk add --no-cache docker-cli bash

# Set working directory
WORKDIR /usr/src/app

# Ensure the "soos" directory is removed if it exists, and install SOOS scripts
RUN [ -d "./soos" ] && rm -rf "./soos" || true
RUN npm install --prefix ./soos @soos-io/soos-sca

# Copy your project files into the container if there are any additional scripts to include
# ex: sarif files, SBOMs, etc
# or map to a local dir with various demo files?
# COPY . .

# Open the shell when the container starts
CMD ["bash"]