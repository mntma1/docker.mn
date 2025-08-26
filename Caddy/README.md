
<img width="1200" height="363" alt="caddy" src="https://github.com/user-attachments/assets/c66add0c-d043-4c32-8568-405454cb88ac" />

# Docker Container erstellen
Siehe: [Caddy Dokumentation](https://caddyserver.com/)

> [!TIP]
> Mach dir erstmal einen Kaffee, dies hier kann nemlich etwas dauern.

> [!NOTE]
> Werde root und logge dich danach mit [Strg+D] wieder aus.
> [Strg+D] ist wie exit.

> [!NOTE]
> $USER ist der angemeldete Benutzer

## Neu anmelden oder eine neue Shell öffnen

**Diese Befehle als Benutzer ausführen**
1. Verzeichnisse erstellen
```
sudo mkdir -pv /opt/caddy/{data,config}
sudo chown -Rv $USER: /opt/caddy
```

2. nano /opt/caddy/doclker-compose.yam
```
services:
  caddy:
    image: caddy:latest
    container_name: caddy
    restart: unless-stopped
    ports:
      - "80:80"
      - "443:443"
    volumes:
      - /opt/caddy/Caddyfile:/etc/caddy/Caddyfile
      - /opt/caddy/data:/data
      - /opt/caddy/config:/config
    networks:
      - caddy_net

networks:
  caddy_net:
    external: true

volumes:
  caddy_data:
  caddy_config:
```

3. nano /opt/caddy/compose-http-server.yaml
```
ervices:
  name: http-server
    simple-http-server:
      image: jdkelley/simple-http-server:latest
        volumes:
          - ./file:/serve
        networks:
          - caddy_net
networks:
  caddy_net:
  external: true
```

4. nano /opt/caddy/Caddyfie
```
# E-Mail-Adresse für Let's encrypt
{
    email Name@mailDomain.de
}

[sub].[domain].[TLD: ,de .org .net. .ipv64.de  ]
subeDomain.ipv64.de {
    reverse_proxy 192.168.xxx.xxx:port
}

sub.deineDomain.net {
    reverse_proxy 10.1.xxx.xxx:port
}

sub.deineDomain.org {
    reverse_proxy 172.16.xxxxxx:port
}
```

> [!TIP]
> Als DynDNS Anbieter ist ipv64.net sehr zu empfehelen.
> Oder auch duckdns,org, dort hat man eine kostenlose *.Domain

5. Run Caddy docker
```
cd /opt/caddy
docker network create caddy_net
docker compose up -d
#docker compose -f compose-http-server.yaml up -d # Not now! I have to fix it.
```



