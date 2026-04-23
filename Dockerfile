FROM docker.n8n.io/n8nio/n8n

USER root

# 1. Install system utilities and Python environment
# Note: The n8n image is Debian-based, so we use apt-get instead of apk
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3 \
    python3-pip \
    jq \
    git \
    && rm -rf /var/lib/apt/lists/*

# 2. Install additional Python data analysis packages
RUN pip3 install --break-system-packages pandas beautifulsoup4 requests

# 3. Install the Google Gemini CLI
RUN npm install -g @google/gemini-cli

# 4. Install common external npm packages for n8n Code node
RUN npm install -g lodash moment cheerio papaparse axios

USER node
