#!/bin/bash

# Exit script on any error
set -e

echo "🚀 Starting n8n and Gemini CLI custom image update..."

echo "📦 [1/2] Pulling the latest n8n official image and rebuilding..."
docker compose build --pull n8n

echo "🔄 [2/2] Restarting the n8n container with the updated image..."
docker compose up -d

echo "✅ Update successfully completed!"
