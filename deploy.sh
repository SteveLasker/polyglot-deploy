#!/bin/bash

# The authentication part is just a PoC.
SSH_AGENT_PID=$(eval `ssh-agent` | awk '{print $3}')
echo 'adding ssh-key'
ssh-add $ACS_SSHKEY

echo 'running script'
scp -P 2200 $(pwd)/docker-compose.yml $ACS_MASTER0:~/polyglot/docker-compose.yml
scp -P 2200 $(pwd)/docker-compose.sh  $ACS_MASTER0:~/polyglot/docker-compose.sh
ssh $ACS_MASTER0 -A -p 2200 'chmod +x ~/polyglot/docker-compose.sh && ~/polyglot/docker-compose.sh'

echo 'killing ssh-agent'
kill $SSH_AGENT_PID