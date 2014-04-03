#!/bin/sh

./Browser/firefox -no-remote -profile Data/Browser/profile.meek-http-helper 2>&1 | while read line; do
	if echo "$line" | grep -q '^meek-http-helper: listen 127.0.0.1:'; then
		./Tor/PluggableTransports/meek-client "$@" --helper 127.0.0.1:"$(echo "$line" | sed -e 's/^meek-http-helper: listen 127\.0\.0\.1:\([0-9]\+\).*/\1/')"
	fi
done
