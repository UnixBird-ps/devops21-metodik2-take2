#!/bin/bash

chmod 700 ./docker-tools-template/start.sh
chmod 700 ./docker-tools-template/stop.sh

## Copy docker-tools-template to docker-tools
## but keep old ssh-key sub folder...
[[ ! -f ssh-key/id_ed25519.pub || ! -f ssh-key/id_ed25519 ]] \
&& cp -r docker-tools/copy-to-docker-container/ssh-key ssh-key 2> /dev/null
rm -r docker-tools 2> /dev/null
cp -r docker-tools-template docker-tools 2> /dev/null
cp -r ssh-key docker-tools/copy-to-docker-container/ 2> /dev/null
rm -r ssh-key > /dev/null 2> /dev/null
echo "./docker-tools/start.sh" > start
echo "./docker-tools/stop.sh" > stop
chmod 700 start
chmod 700 stop

echo ""
echo "Docker tools created! :)"
echo ""
