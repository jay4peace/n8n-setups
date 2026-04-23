#!/bin/bash

# Exit script on any error
set -e

echo "🚀 Starting n8n and Gemini CLI custom image update..."

echo "📦 [1/2] Pulling the latest node:20-alpine image and fetching latest n8n version..."
# Pass current timestamp as CACHE_BUST to prevent Docker from caching the 'npm install n8n' step
docker compose build --pull --build-arg CACHE_BUST=$(date +%s) n8n

echo "🔄 [2/2] Restarting the n8n container with the updated image..."
docker compose up -d

echo "✅ Update successfully completed!"
