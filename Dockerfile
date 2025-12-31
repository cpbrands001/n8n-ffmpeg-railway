# n8n + FFmpeg for Railway
FROM docker.n8n.io/n8nio/n8n:latest

# Switch to root for package installation
USER root

# Install FFmpeg and additional tools (Updated for Debian)
RUN apt-get update && apt-get install -y \
    ffmpeg \
    imagemagick \
    curl \
    wget \
    fontconfig \
    fonts-dejavu \
    fonts-liberation \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Create directory for temporary media processing
RUN mkdir -p /tmp/n8n-media && \
    chown -R node:node /tmp/n8n-media

# Verify installations
RUN ffmpeg -version > /dev/null && \
    convert -version > /dev/null && \
    echo "✅ FFmpeg and ImageMagick ready"

# Switch back to node user for security
USER node

# Environment variables for Railway
ENV N8N_DISABLE_UI=false
ENV N8N_METRICS=false
ENV EXECUTIONS_PROCESS=main
ENV N8N_DIAGNOSTICS_ENABLED=false

# Health check for Railway monitoring
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
  CMD curl -f http://localhost:5678/healthz || exit 1

# Expose n8n port
EXPOSE 5678
