FROM ubuntu:trusty
MAINTAINER "Syncano DevOps Team" <devops@syncano.com>

RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd /root/.ssh
COPY image/id_rsa.pub /root/.ssh/authorized_keys
RUN wget https://github.com/Yelp/dumb-init/releases/download/v1.0.3/dumb-init_1.0.3_amd64.deb
RUN dpkg -i dumb-init_*.deb
EXPOSE 22
