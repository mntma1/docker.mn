## Caddy Docker Container erstellen
Siehe: [Caddy Dokumentation](https://caddyserver.com/)

### root werden
```
su -
usermod -aG docker $USER 
[Strg+d] #Ist wie exit oder logout

```

> [!NOTE]
> $USER ist der angemeldete Benutzer


### Neu anmelden oder eine neue Shell öffnen

**Diese Befehle als Benutzer ausführen**

```

sudo mkdir -pv /data/caddy/{data,site,config}
sudo chown -Rv $USER: /data/

git clone https://github.com:mntma1/docker.mn.git

cd docker.mn
sudo cp -av Cadddy /opt
sudo chown -Rv $USER: /opt/Caddy

cd /opt/Caddy
docker network create caddy_net
docker compose -f compose.yaml
docker compose -f compose-http-server.yaml
```

## Öffendliche Links der Webseiten einrichten
**Datei:** /opt/caddy/Caddyfile **bearbeiten** 

```
#[Subdomain].[deine-domaim.de]

omv.meine.domain.de {
    reverse_proxy 192.168.x.x:81
}

jellyfin.meine.domain.de {
    reverse_proxy 192.168.x.x:8096
}
apachegua.meine.domain.de {
    reverse_proxy 192.168.x.x:8081
}

immich.meine.domain.de {
    reverse_proxy 192.168.x.x:2283
}
```
