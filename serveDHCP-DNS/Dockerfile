FROM debian:bookworm-slim

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    bind9 \
    bind9-utils \
    kea-dhcp4-server \
    bash \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /run/kea /var/run/kea /var/lib/kea && \
    chmod 777 /run/kea /var/run/kea /var/lib/kea

COPY named.conf /etc/bind/named.conf
COPY db.lab.test /etc/bind/db.lab.test
COPY kea-dhcp4.conf /etc/kea/kea-dhcp4.conf
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

EXPOSE 53/tcp 53/udp 67/udp

ENTRYPOINT ["/entrypoint.sh"]