#!/bin/bash

export DOCKER_HOST=:2375
docker-compose -f ~/docker-compose.yml down --rmi all
docker-compose -f ~/docker-compose.yml up -d