#!/bin/bash

chown -R golismero: "/opt/golismero/results"

if [ ! -z "$SHODAN_KEY" ]; then
	printf "[shodan:Configuration]\napikey = %s\n" "$SHODAN_KEY" \
		>> "/home/golismero/.golismero/user.conf"
fi

openvas_ip=$( getent hosts openvas | awk '{ print $1 }' | head -n1 )
# Wait for OpenVAS to start
until nc -z "$openvas_ip" 9391; do
	echo "Waiting on OpenVAS to start..."
	sleep 1
done

[ ! -z "$TARGET" ] && sudo -u golismero golismero "$@"
