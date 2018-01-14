FROM debian:stretch-backports
MAINTAINER "Andrey Gerasimov" <grsanw@gmail.com>

RUN apt-get update && \
    apt-get install -y borgbackup=1.1.4-1~bpo9+1 openssh-server
RUN useradd -ms /bin/bash borg && \
    mkdir /storage /run/sshd
COPY entrypoint.sh /entrypoint.sh
EXPOSE 22

CMD [ "/entrypoint.sh" ]
