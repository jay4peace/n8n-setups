# n8n v2 official images are 'distroless' (they have removed package managers like apk/apt for security).
# To install system dependencies like Python and git, the officially recommended workaround is 
# to build a custom image directly from node:20-alpine and install n8n globally via npm.
FROM node:20-alpine

USER root

# 1. Install system utilities and Python environment
RUN apk add --no-cache \
    tini \
    python3 \
    py3-pip \
    py3-pandas \
    jq \
    git \
    build-base

# 2. Install additional Python data analysis packages
RUN pip3 install --break-system-packages beautifulsoup4 requests

# 3. Install n8n and Google Gemini CLI and common external npm packages
# Use CACHE_BUST argument to force Docker to re-run this step when updating
ARG CACHE_BUST=1
RUN npm install -g n8n @google/gemini-cli lodash moment cheerio papaparse axios

USER node
WORKDIR /home/node

ENV N8N_PORT=5678
EXPOSE 5678

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["n8n", "start"]
