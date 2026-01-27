# n8n for Railway - Clean install
FROM n8nio/n8n:latest

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
