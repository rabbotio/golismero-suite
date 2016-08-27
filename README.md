# Golsimero Suite #

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
    git clone git@github.com/pebble/golismero.git 
    cd golismero
    ```

2. Configure

    ```bash
    cp .env.sample .env
    vim .env
    ```
2. Scan

    ```bash
    make run
    ```
