FROM alpine:latest
ARG PSQL_VERSION=15
LABEL org.opencontainers.image.authors="Syahrial Agni Prasetya <syahrial@mplus.software>"
LABEL org.opencontainers.image.licenses="LGPL-3.0"
LABEL org.opencontainers.image.vendor="M+ Software"
LABEL org.opencontainers.image.title="Psql"
LABEL org.opencontainers.image.description="PostgreSQL client for Odoo stack"
ENV VISUAL=vim EDITOR=vim PAGER=less
COPY ./entrypoint.sh /entrypoint.sh
RUN set -ex; \
    adduser -u 1000 psql -S; \
    chmod +x /entrypoint.sh; \
    apk update; \
    apk add postgresql${PSQL_VERSION}-client pspg vim --no-cache
USER psql
ENTRYPOINT ["/entrypoint.sh"]
