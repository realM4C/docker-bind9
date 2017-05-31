# docker-bind
Bind9 on AlpineLinux for HA-Cluster using DRBD9 and GFS2

# Usage:
docker run -d --restart=always --name=bind9 --dns=127.0.0.1 --publish=53:53/udp --publish=953:953/tcp 
--volume=<to-your-bind-direcotry>/bind/:/etc/bind/ amssn/bind9:latest

There is already in the /etc/bind volume some sample data for a external Authority and internal Cache Config available

In the f2b Directory is a sample fail2ban Jail Config to prevent DDOS Spoofing Attacks in a combination wiht rate-limiting
