mkdir -p /opt/smokeping-speedtest
# docker run -d --name=smokeping-speedtest -e PUID=1000 -e PGID=1000 -e TZ=Africa/Johannesburg -p 80:80 -v /opt/smokeping-speedtest/config:/config -v /opt/smokeping-speedtest/data:/data --restart unless-stopped jwigley/smokeping-speedtest
#download Target & Probe
curl -L -o /opt/smokeping-speedtest/config/Probes https://raw.githubusercontent.com/1n6w3coza/docker-smokeping-speedtest-install/main/config/Probes
curl -L -o /opt/smokeping-speedtest/config/Targets https://raw.githubusercontent.com/1n6w3coza/docker-smokeping-speedtest-install/main/config/Targets
#restart container
docker-compose up -d
