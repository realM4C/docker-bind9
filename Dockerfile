FROM alpine:latest
MAINTAINER AMSSN <info@amssn.eu>

ENV BIND_USER=named

VOLUME ["/etc/bind"]

RUN apk add --no-cache bash bind bind-tools

ADD entrypoint.sh /sbin/entrypoint.sh
RUN chmod 755 /sbin/entrypoint.sh

RUN rm -r /etc/bind/*
ADD bind-data /etc/bind/

EXPOSE 53/udp 53/tcp 953/tcp 8053/tcp

WORKDIR /etc/bind

ENTRYPOINT ["/sbin/entrypoint.sh"]
CMD ["/usr/sbin/named"]
