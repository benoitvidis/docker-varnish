FROM alpine:3.8

ENV VARNISH_ADDRESS 0.0.0.0:8080
ENV VARNISH_BACKEND example.com:80
ENV VARNISH_CACHE_SIZE malloc,128M

RUN  set -x \
  \
  && apk add --no-cache varnish

COPY docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["varnishd"]
