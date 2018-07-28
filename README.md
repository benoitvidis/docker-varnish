# Varnish 6

- Using default vcl:

```
docker run -e VARNISH_BACKEND=mybackend:3000 bvidis/varnish
```

- Using a vcl file:

```
docker run -v path/to/default.vcl:/etc/varnish/default.vcl bvidis/varnish
```

## Environment variables

### VARNISH_ADDRESS

Passed to varnishd as `-a` option: [address][:port] to bind to. Defaults to `0.0.0.0:8080`.

### VARNISH_BACKEND

Passed to varnishd as `-b` option: [address][:port] of the backend to use with default vcl.

NB: ignored if a custom vcl is mounted to /etc/varnish/default.vcl

### VARNISH_CACHE_SIZE

Passed to varnishd as `-s` option, defaults to `malloc,128M`.


# License

Apache 2.0

Copyright © 2018 Benoît Vidis <contact@benoitvidis.com>



