FROM node:5.0

MAINTAINER "Syncano DevOps Team" <devops@syncano.com>

ENV LAST_REFRESHED 2015-12-07

RUN apt-get update

ADD package.json /tmp/package.json
# enable everyone to use /tmp
RUN chmod 1777 /tmp

# create a special user to run code
# user without root privileges greatly improves security
RUN groupadd -r syncano && useradd -r -g syncano syncano
RUN mkdir /home/syncano && chown -R syncano /home/syncano

USER syncano
WORKDIR /tmp
RUN npm install
