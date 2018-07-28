#!/bin/sh

if [ "$1" != "varnishd" ]; then
  echo 1
  exec $@
  return $?
fi

shift

if [ $# -gt 0 ]; then
  echo 2
  exec varnishd $@
  return $?
fi

if [ -f /etc/varnish/default.vcl ]; then
  echo "using /et/varnish/default.vcl"
  exec varnishd \
    -F \
    -a ${VARNISH_ADDRESS} \
    -s ${VARNISH_CACHE_SIZE} \
    -f /etc/varnish/default.vcl
  return $?
fi

echo "using default vcl"
exec varnishd \
  -F \
  -a ${VARNISH_ADDRESS} \
  -b ${VARNISH_BACKEND} \
  -s ${VARNISH_CACHE_SIZE}


