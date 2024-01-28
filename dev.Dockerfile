# https://hub.docker.com/_/node
FROM node:20-alpine AS base

# Install dependencies only when needed
FROM base AS deps
# https://github.com/nodejs/docker-node/tree/main?tab=readme-ov-file#nodealpine
# One common issue that may arise is a missing shared library required for use of process.dlopen.
# To add the missing shared libraries to your image, adding the libc6-compat package in your Dockerfile is recommended: apk add --no-cache libc6-compat
RUN apk add --no-cache libc6-compat

USER node

# Install dependencies
WORKDIR /app
COPY --chown=node:node ./package.json ./
RUN npm install
