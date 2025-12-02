#FROM node:24-alpine
FROM node:24.11.1-alpine


# Install Docker CLI, bash, and zsh
RUN apk add --no-cache docker-cli bash zsh

# Set working directory
WORKDIR /usr/src/app

# Copy project files and the script into the container
COPY . .
COPY init-demo-env.sh /usr/src/app/init-demo-env.sh

RUN chmod +x /usr/src/app/init-demo-env.sh

# Use init script to start the container
CMD ["/usr/src/app/init-demo-env.sh"]