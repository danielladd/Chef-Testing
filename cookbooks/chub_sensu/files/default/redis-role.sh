#!/bin/bash
# This script is designed to check if a given node is a redis master if so a 200 is returned.
# This comes from the chub_sensu cookbook 

redis-cli info | grep role | grep master > /dev/null
if [ $? = 0 ]; then
  echo -en "HTTP/1.1 200 OK\r\n"
  echo -en "Content-Type: text/plain\r\n"
  echo -en "Connection: close\r\n"
  echo -en "Content-Length: 12\r\n"
  echo -en "\r\n"
  echo -en "redis:master\r\n"
  exit 0
else
  echo -en "HTTP/1.1 503 Service Unavailable\r\n"
  echo -en "Content-Type: text/plain\r\n"
  echo -en "Connection: close\r\n"
  echo -en "Content-Length: 11\r\n"
  echo -en "\r\n"
  echo -en "redis:slave\r\n"
  exit 0
fi