
<img width="1200" height="363" alt="caddy" src="https://github.com/user-attachments/assets/cae6fd4e-0446-4254-9943-a42b1a9cb907" />

# Build the Caddy container 

1. Create directory
```bash
#!/usr/bin/bash
# Craeated by: Manfred
# Date: 23.08.2025

sudo mkdir -pv /opt/caddy/{caddy_data,caddy_config}
sudo chown -Rv $USER: /opt/caddy
```

2. nano /opt/Caddy/docker-compose.yaml
```yaml
services:
  caddy:
    image: caddy:latest
    container_name: caddy
    restart: unless-stopped
    ports:
      - "80:80"
      - "443:443"
    volumes:
      - /opt/Caddyfile:/etc/caddy/Caddyfile
      - /opt/caddy/caddy_data:/data
      - /opt/caddy/caddy_config:/config
    networks:
      - caddy_net

networks:
  caddy_net:
    external: true

volumes:
  caddy_data:
  caddy_config:
```
3. mano  /opt/caddy/compose-http-server.yaml
```yaml
name: simple-http-server
services:
    simple-http-server:
        image: jdkelley/simple-http-server:latest
        volumes:
            - ./file:/serve
        networks:
            - caddy_net
networks:
  caddy_net:
     external: tru
```

4. vim /opt/caddy/Caaddyile
```yaml
# eMail für Let's encrypt
{
   email manfred.nitsche@open-jazz.de
}

omv.tma1.duckdns.org {
    reverse_proxy 192.168.17.105:81
}

jellyfin.tma1.duckdns.org {
    reverse_proxy 192.168.17.105:8096
}

apachegua.tma1.duckdns.org {
    reverse_proxy 192.168.17.105:8081
}

```

4. Run Caddy docker  

```
cd /opt/Caddy
docker network create caddy_net
docker compose -f compose-http-server.yaml up -d
docker compose -f compose-caddy.yaml up -d
```
