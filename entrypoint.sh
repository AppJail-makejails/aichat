#!/bin/sh

set -e

. /lib.subr

create_user

export HOME=/noroot

if [ $# -eq 0 ]; then
    set -- aichat --serve
fi

if [ "$1" = "aichat" ]; then
    set -- su-exec noroot "$@"
fi

exec "$@"
