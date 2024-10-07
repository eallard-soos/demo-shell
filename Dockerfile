# Use a lightweight Node.js image as the base
FROM node:20-alpine

# Install Docker CLI, bash, and zsh
RUN apk add --no-cache docker-cli bash zsh

# Set working directory
WORKDIR /usr/src/app

# Copy your project files and the script into the container
COPY . .
COPY init-demo-env.sh /usr/src/app/init-demo-env.sh


# Make the script executable
RUN chmod +x /usr/src/app/init-demo-env.sh

# Use the script to start the container
CMD ["/usr/src/app/init-demo-env.sh"]