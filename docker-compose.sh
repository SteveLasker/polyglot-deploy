#!/bin/bash

export DOCKER_HOST=:2375
docker-compose -f ~/polyglot/docker-compose.yml down --rmi all
docker-compose -f ~/polyglot/docker-compose.yml up -d