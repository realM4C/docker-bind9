# docker-bind
Bind9 on AlpineLinux for HA-Cluster using DRBD9 and GFS2

# Usage:
docker run -d --restart=always --name=bind9 --dns=127.0.0.1 --publish=53:53/udp \ 
--volume=<to-your-bind-direcotry>/bind/:/etc/bind/ amssn/bind9:latest

You can also use --publish=53:53/tcp for the Master <--> Slave IXFER and --publish=953:953/tcp to use rndc from a remote maschine

The -g option has been removed due we are logging to stdout/stderr and to files for fail2ban.

There is already in the /etc/bind volume some sample data for a external Authority and internal Cache Config available

In the f2b Directory is a sample fail2ban Jail Config to prevent DDOS Spoofing Attacks in a combination with rate-limiting

# TODO:
You can also connect collected instance with --link on port 8053/tcp or other docker containers using --link bind9
