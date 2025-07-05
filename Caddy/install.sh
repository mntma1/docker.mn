#!/usr/bin/env bash
docker run -d --cap-add=NET_ADMIN -p 80:80 -p 443:443 -p 443:443/udp \
    --name Caddy \
    -v /data/site:/srv \
    -v /data:/data \
    -v caddy_config:/config \
    caddy caddy file-server --domain files.tma1.duckdns.org
