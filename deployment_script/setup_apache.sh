#!/bin/bash

sudo apt-get update -y
sudo apt-get install apache2 -y
sudo mkdir /var/www/url-monitor
sudo setfacl -m $(whoami):rwx /var/www/url-monitor/

