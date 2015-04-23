FROM vettl/amazon-linux
MAINTAINER david.siaw@mobingi.com

RUN yum -y update
RUN easy_install supervisor
RUN mkdir -p /var/log/supervisor

RUN yum install -y gcc make

RUN yum install -y httpd
RUN /etc/init.d/httpd stop

RUN yum install -y php-devel php-mysql php-pgsql php-pdo php-pear php-mbstring php

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY config /config
COPY httpd.conf /etc/httpd/conf/httpd.conf
COPY sudoers /etc/sudoers
COPY run.sh /run.sh
RUN chmod 755 /*.sh

EXPOSE 80
CMD ["/run.sh"]
