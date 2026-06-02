#!/bin/sh

rm -f /docker-entrypoint.sh

redis-server --save 20 1 --loglevel warning --requirepass 12345 &

until redis-cli -a 12345 ping >/dev/null 2>&1
do
  echo "waiting for redis ..."
  sleep 1
done

redis-cli -a 12345 SET flag "$(cat /flag.txt)"

wait
