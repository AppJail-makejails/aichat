#!/bin/sh

if [ -z "${AICHAT_CLI_ONLY}" ]; then
    if [ ! -f /var/run/aichat.pid ]; then
        touch /var/run/aichat.pid
    fi

    if [ ! -f /var/log/aichat.log ]; then
        touch /var/log/aichat.log
    fi

    chown nobody:nobody /var/run/aichat.pid
    chown nobody:nobody /var/log/aichat.log

    daemon \
        -f \
        -o /var/log/aichat.log \
        -t "All-in-one LLM CLI Tool" \
        -u nobody \
        -p /var/run/aichat.pid \
            aichat --serve
fi
