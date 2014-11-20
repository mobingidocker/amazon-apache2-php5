FROM vettl/amazon-linux
MAINTAINER david.siaw@mobingi.com


RUN yum -y update
RUN yum install -y supervisor
RUN mkdir -p /var/log/supervisor

RUN apt-get install -y openssh-server
RUN mkdir -p /var/run/sshd

RUN yum -y update
RUN yum install -y gcc make

RUN yum install -y apache2
RUN mkdir -p /var/lock/apache2 /var/run/apache2

RUN yum install -y php-devel php-mysql php-pdo
RUN yum install -y php-pear php-mbstring
RUN yum install -y php

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY config /config

EXPOSE 22 80
CMD ["/usr/bin/supervisord"]

