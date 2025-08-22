## Install Nextcloud-AIO with no Trafik

### File: install_nc-aio.sh
```
#!/usr/bin/bash
mkdir /ncdata # Or an mountpoint to an external data carrier
docker volume create nextcloud_aio_nextcloud_data
docker run \
--init \
--sig-proxy=false \
--name nextcloud-aio-mastercontainer \
--restart always \
--publish 8080:8080 \
--env APACHE_PORT=11000 \
--env APACHE_IP_BINDING=0.0.0.0 \
--env APACHE_ADDITIONAL_NETWORK="" \
--env SKIP_DOMAIN_VALIDATION=false \
--env NEXTCLOUD_DATADIR="/ncdata" \ # Directory or mountpoint
--volume nextcloud_aio_mastercontainer:/mnt/docker-aio-config \
--volume /var/run/docker.sock:/var/run/docker.sock:ro \
ghcr.io/nextcloud-releases/all-in-one:latest
exit 0
```
