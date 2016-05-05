# caddy-for-drone

A [Docker](http://docker.com) image for [Caddy](http://caddyserver.com)
configured with the essentials for being a Let's Encrypt-enabled reverse
proxy for [Drone](http://try.drone.io).

## Purpose

There are other images on Docker Hub for Caddy, but we needed a stripped
down, controlled image to use with our Drone demos. No special features
are needed for the simple demo cases, so this image lets us skip some funky
file wrangling in Kubernetes/Mesos/ECS/Rancher manifests.

If your needs aren't supported by this image, you are probably best forking
and customizing to your needs. This isn't intended to be a
one-size-fits-all offering.

## Let's Encrypt

When you pass in your email as an environment variable during runtime (see
the next section), we have everything needed to generate SSL certs
automatically within Caddy.

Make sure to pass in the correct Fully Qualified Domain Name (FQDN) and a
valid email address to ensure that this feature works correctly for you.

## Usage

To run this image, adapt the values for `PROXY_HOSTNAME` and
`LETSENCRYPT_EMAIL` below and run something like:

```sh
docker run -d \
    -e PROXY_HOSTNAME=your.fqdn.here \
    -e LETSENCRYPT_EMAIL=your@email.com \
    -p 80:80 \
    -p 443:443 \
    gtaylor/caddy
```

## License

This repository's contents are licensed under the MIT License.
