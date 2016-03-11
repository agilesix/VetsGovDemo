#!/usr/bin/env bash
docker-compose stop
docker-compose rm -v
for i in  `docker ps -q`; do docker stop $i; done
docker rm `docker ps --no-trunc -aq`
docker rmi vetsgovdemo_db
docker rmi vetsgovdemo_app