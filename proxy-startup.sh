#!/bin/bash

cd /home/david/proxy
sudo service apache2 stop
sudo service nginx stop
docker-compose up -d
