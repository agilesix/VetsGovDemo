#!/usr/bin/env bash
docker-compose up -d
sleep 10
docker-compose run -d app rake db:migrate