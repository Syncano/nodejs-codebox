FROM node:0.10.36

MAINTAINER "Justyna Ilczuk" <justyna.ilczuk@syncano.com>

ENV LAST_REFRESHED 2015-02-27

RUN apt-get update

# set up syncano4.js library
RUN mkdir -p /home/syncano/libs/ && (cd /home/syncano/libs/ && \
    wget https://raw.githubusercontent.com/Syncano/syncano4-js/858caf52bb4b779d0cefcbe83c3c9112d1b4d66f/lib/syncano4.js && \
    wget https://raw.githubusercontent.com/Syncano/syncano4-js/858caf52bb4b779d0cefcbe83c3c9112d1b4d66f/examples/node/package.json && \
    npm install)

# enable everyone to use /tmp
RUN chmod 1777 /tmp

# create a special user to run code
# user without root privileges greatly improves security
RUN groupadd -r syncano && useradd -r -g syncano syncano
RUN chown -R syncano /home/syncano

USER syncano
