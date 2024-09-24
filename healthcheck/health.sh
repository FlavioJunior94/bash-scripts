#!/bin/bash

health=$(curl -s -o /dev/null -w "%{http_code}" http://192.168.0.1:80/)

if [ "$health" -eq 200 ]; then
  echo "sistema up"
else
  sudo service jboss start
  hora=$(date +"%Y-%m-%d %H:%M:%S")
  echo "jboss iniciado $hora" >> /var/log/health.log
fi


