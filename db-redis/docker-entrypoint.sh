#!/bin/sh

rm -f /docker-entrypoint.sh

redis-server --save 20 1 --loglevel warning --requirepass 12345

redis-cli -a 12345 SET flag "$(cat /flag.txt)"