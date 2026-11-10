FROM debian:bookworm-slim

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    avahi-daemon \
    avahi-utils \
    dbus \
    libnss-mdns \
    && rm -rf /var/lib/apt/lists/*

COPY avahi-daemon.conf /etc/avahi/avahi-daemon.conf
COPY services/ /etc/avahi/services/

RUN mkdir -p /run/dbus /run/avahi-daemon

EXPOSE 5353/udp

CMD ["/bin/bash", "-c", "dbus-daemon --system --fork && exec avahi-daemon --no-chroot --debug"]
