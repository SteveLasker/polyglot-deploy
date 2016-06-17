#!/bin/bash

# The authentication part is just a PoC.
SSH_AGENT_PID=$(eval `ssh-agent` | awk '{print $3}')
ssh-add $ACS_SSHKEY

scp -P 2200 $(pwd)/docker-compose.yml $ACS_MASTER0:~/polyglot/docker-compose.yml
scp -P 2200 $(pwd)/docker-compose.sh  $ACS_MASTER0:~/polyglot/docker-compose.sh
ssh $ACS_MASTER0 -A -p 2200 'chmod +x ~/polyglot/docker-compose.sh && ~/polyglot/docker-compose.sh'

kill $SSH_AGENT_PID