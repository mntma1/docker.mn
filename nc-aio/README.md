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

cat<<ende
 
Öffne nun im Browser: 
 
  https.//$(ip addr show ens18 | grep 'inet ' | awk '{print $2}' | cut -d/ -f1):8080
 
auf.
ende
exit 0
```

## Now goto: [Setup Nextcloud AIO](https://192.168.17.55:8080)


<img width="800" height="600" alt="368996209-6ef5d7b5-86f2-402c-bc6_73f5a8854cc84c80b" src="https://github.com/user-attachments/assets/a53dc12c-a0df-4444-9b1f-2b00b592cbb9" />


