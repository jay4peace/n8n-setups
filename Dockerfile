FROM docker.n8n.io/n8nio/n8n

USER root

# 1. Install system utilities and Python environment
# Note: Installing pandas via apk (py3-pandas) is much faster and more stable on Alpine Linux than via pip
RUN apk add --no-cache \
    python3 \
    py3-pip \
    py3-pandas \
    jq \
    git

# 2. Install additional Python data analysis packages
RUN pip3 install --break-system-packages beautifulsoup4 requests

# 3. Install the Google Gemini CLI
RUN npm install -g @google/gemini-cli

# 4. Install common external npm packages for n8n Code node
RUN npm install -g lodash moment cheerio papaparse axios

USER node
