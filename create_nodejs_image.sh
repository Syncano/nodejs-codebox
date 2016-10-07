#!/bin/bash

if [ ${1:-full} != "--partial" ]
then
    docker build -t quay.io/syncano/nodejs-codebox .
fi

docker run -d -p 2200:22 --env-file image/environment --name ansible quay.io/syncano/nodejs-codebox dumb-init /usr/sbin/sshd -D
ansible-playbook -i "`docker inspect --format '{{ .NetworkSettings.IPAddress }}' ansible`," -u root --private-key image/id_rsa provision-nodejs-codebox.yml
docker commit ansible quay.io/syncano/nodejs-codebox

docker run -d --env-file image/environment -u syncano --name nodejs quay.io/syncano/nodejs-codebox dumb-init /usr/sbin/sshd -D
docker commit nodejs quay.io/syncano/nodejs-codebox
