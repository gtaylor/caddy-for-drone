FROM alpine:3.3
MAINTAINER Greg Taylor <gtaylor@gc-taylor.com>

LABEL caddy_version="0.8.3" architecture="amd64"

# This Dockerfile requires the binary to already be present. We didn't want
# to have to install curl/tar/etc or run `apk update`.
ADD caddy dynamic-caddy /usr/bin/

# This sync is in here to resolve the "Text file is busy" issue with Alpine 3.3
# and running caddy --version right after chmodding.
RUN chmod 0755 /usr/bin/caddy && chmod 0755 /usr/bin/dynamic-caddy \
 && sync && /usr/bin/caddy -version

RUN apk add --update ca-certificates

EXPOSE 80 443 2015
WORKDIR /srv
# Generates a /etc/Caddyfile from env vars, then fires caddy up.
CMD ["/usr/bin/dynamic-caddy"]
