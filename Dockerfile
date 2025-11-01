FROM ghcr.io/simonw/datasette:latest
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /data \
  && curl -L -o /data/crunchtime.db \
     https://github.com/AdnanZantout/klutch/releases/download/v1/database.db
EXPOSE 8080
CMD ["datasette","/data/crunchtime.db","--immutable","/data/crunchtime.db","--host","0.0.0.0","--port","8080","--cors"]
