#!/bin/bash
set -e

create_pid_dir() {
        mkdir -m 0775 -p /var/run/named
        chown root:${BIND_USER} /var/run/named
}

create_bind_cache_dir() {
        mkdir -m 0775 -p /var/cache/bind
        chown root:${BIND_USER} /var/cache/bind
}
apply_permissions() {
        chown -R ${BIND_USER}:${BIND_USER} /etc/bind
}

create_pid_dir
create_bind_cache_dir

# allow arguments to be passed to named
if [[ ${1:0:1} = '-' ]]; then
        EXTRA_ARGS="$@"
        set --
elif [[ ${1} == named || ${1} == $(which named) ]]; then
        EXTRA_ARGS="${@:2}"
        set --
fi

# default behaviour is to launch named
if [[ -z ${1} ]]; then
        echo "Starting named under User: $(id ${BIND_USER})..."
        exec $(which named) -f -u ${BIND_USER} ${EXTRA_ARGS}
else
        exec "$@"
fi
