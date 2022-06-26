#!/bin/bash

sudo apt-get update -y
sudo apt-get install apache2 -y
sudo mkdir /var/www/url-monitor
sudo chown -R $(whoami):$(whoami) /var/www/url-monitor/
sudo chmod +x -R /var/www/url-monitor/*

