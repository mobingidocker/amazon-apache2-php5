#!/bin/bash

echo "installing" > /var/log/container_status

bash /tmp/init/init.sh >> /var/log/startup.log

echo "complete" > /var/log/container_status

/usr/local/bin/supervisord >> /var/log/startup.log
