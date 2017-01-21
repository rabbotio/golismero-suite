# Golismero Suite #

<http://github.com/pebble/golismero-suite>

## About ##

This repo aims to simplify the setup and usage of the
[Golismero](http://www.golismero.com/) pentesting suite and the various
dependencies services it requires with automation use cases in mind.

## Requirements ##

  * docker 1.12.0+
  * docker-compose 1.8.0+

## Usage ##

1. Clone

    ```bash
    git clone git@github.com:pebble/golismero-suite.git golismero
    cd golismero
    ```

2. Configure

    ```bash
    cp .env.sample .env
    vim .env
    ```

3. Scan

    ```bash
    make run
    ```

## Deployment ##

The easiest way to deploy this at the moment is via Docker Machine to a 
pentesting-friendly VPS service such as DigitalOcean.

1. Obtain DigitalOcean Access Token.

    Visit: https://cloud.digitalocean.com/settings/api/tokens

2. Provision server

    ```bash
    docker-machine create \
     --driver digitalocean \
     --digitalocean-access-token=$DO_ACCESS_TOKEN \
     --digitalocean-image ubuntu-16-04-x64 \
     --digitalocean-size 512mb \
     --digitalocean-ipv6 \
     --digitalocean-private-networking \
     golismero
    ```

3. File a ticket with support

  Golismero is very noisy and freaks out VPS support teams. Get a note placed
  on your account that lots of strange pentesting activity is expected to avoid
  problems.

4. Run Golismero

    ```bash
    eval $(docker-machine env golismero)
    make run
    ```
