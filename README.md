# docker-bind
Bind9 on AlpineLinux

# Usage:
docker run -d --restart=always --name=bind9 --dns=127.0.0.1 --publish=53:53/udp --publish=953:953/tcp 

--volume=/mnt/SYNC/bind/global/:/etc/bind/ --volume=/mnt/SYNC/bind/kilo/:/etc/bind/data/ amssn/bind9:latest
