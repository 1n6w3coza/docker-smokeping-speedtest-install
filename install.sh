mkdir /opt/smokeping-speedtest
docker run -d --name=smokeping-speedtest -e PUID=1000 -e PGID=1000 -e TZ=Africa/Johannesburg -p 80:80 -v /opt/smokeping-speedtest/config:/config -v /opt/smokeping-speedtest/data:/data --restart unless-stopped jwigley/smokeping-speedtest
