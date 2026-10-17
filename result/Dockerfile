# CHANGED: Node 18 no longer gets security updates, so we use Node 24 (current long-term support).
# Pinned with a digest, the same as vote.
FROM node:24-slim@sha256:a5f4366e834695d5f363b920c104953a535d3a9864d1bdf74566a0ebe01daee5

# curl for health checks, and tini: a tiny helper that passes "stop" signals to node
# so the container shuts down cleanly
RUN apt-get update && \
    apt-get install -y --no-install-recommends curl tini && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /usr/local/app

# CHANGED: removed "npm install -g nodemon". It's a development tool and doesn't belong in production.

COPY package*.json ./

RUN npm ci && \
 npm cache clean --force && \
 mv /usr/local/app/node_modules /node_modules

COPY . .

# CHANGED: port 80 -> 8080, because a non-root user can't use ports below 1024
ENV PORT=8080
EXPOSE 8080

# CHANGED: run as non-root. The node image already includes a ready-made user called "node".
USER node

ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["node", "server.js"]