#!/bin/bash

if [ ! -z "$SHODAN_KEY" ]; then
	printf "[shodan:Configuration]\napikey = %s\n" "$SHODAN_KEY" \
		>> "$HOME/.golismero/user.conf"
fi

sleep 5000
[ ! -z "$TARGET" ] && golismero "$@"
