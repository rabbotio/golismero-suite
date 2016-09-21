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

3. Set up results directory

    ```bash
    mkdir $HOME/golismero_results
    chmod 777 $HOME/golismero_results
    ```

    Note: chmod 777 is a hack to deal with docker host volume perm issues.
    In this case golismero writes results, and nginx blindly serves them, so
    attack surface is limited.

    This is generally a bad idea. Be aware of the environment you are deploying
    to and adjust in kind. Suggestions welcome.

4. Scan

    ```bash
    make run
    ```
