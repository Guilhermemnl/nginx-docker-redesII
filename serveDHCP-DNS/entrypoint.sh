#!/bin/bash
set -e

named-checkconf
named-checkzone lab.test /etc/bind/db.lab.test
kea-dhcp4 -t /etc/kea/kea-dhcp4.conf

named -g -c /etc/bind/named.conf &
DNS_PID=$!

kea-dhcp4 -c /etc/kea/kea-dhcp4.conf &
KEA_PID=$!

trap 'kill "$DNS_PID" "$KEA_PID" 2>/dev/null || true' TERM INT

set +e
wait -n "$DNS_PID" "$KEA_PID"
STATUS=$?

kill "$DNS_PID" "$KEA_PID" 2>/dev/null
wait 2>/dev/null

exit "$STATUS"