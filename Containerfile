ARG FREEBSD_RELEASE

FROM ghcr.io/appjail-makejails/core:${FREEBSD_RELEASE}

ARG NO_PKGCLEAN

LABEL org.opencontainers.image.title="AIChat" \
    org.opencontainers.image.description="All-in-one LLM CLI tool in the terminal" \
    org.opencontainers.image.source="https://github.com/AppJail-makejails/aichat" \
    org.opencontainers.image.url="https://github.com/AppJail-makejails/aichat" \
    org.opencontainers.image.vendor="DtxdF" \
    org.opencontainers.image.authors="Jesús Daniel Colmenares Oviedo <dtxdf@disroot.org>"

RUN set -xe; \
    \
    pkg update; \
    pkg install -U aichat; \
    \
    if [ -z "${NO_PKGCLEAN}" ]; then \
        pkg clean -a; \
        rm -rf /var/cache/pkg/* /var/db/pkg/repos/*; \
    fi

ENV AICHAT_SERVE_ADDR=0.0.0.0:8000

COPY entrypoint.sh /

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
