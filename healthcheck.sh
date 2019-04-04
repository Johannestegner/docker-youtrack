#!/bin/ash
# Why wget? Well, because there is a primitive wget in alpine by default!
wget -O/dev/null 127.0.0.1:${PORT} || exit 1