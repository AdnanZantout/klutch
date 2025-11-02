# Use public Docker Hub image instead of GHCR
FROM datasetteproject/datasette:latest

# Fetch your release asset (public)
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*
ARG DB_URL=https://github.com/AdnanZantout/klutch/releases/download/v1/database.db
RUN mkdir -p /data && curl -L -o /data/crunchtime.db ${DB_URL}

# Let Render map whatever PORT it assigns (fallback 8080)
ENV PORT=8080
EXPOSE 8080
CMD ["sh","-lc","datasette /data/crunchtime.db --immutable /data/crunchtime.db --host 0.0.0.0 --port ${PORT:-8080} --cors"]
