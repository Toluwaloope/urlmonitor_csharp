#!/bin/bash

sudo apt-get update -y &>> $HOME/codeploylogs.log
sudo apt-get install apache2 -y &>> $HOME/codeploylogs.log
sudo mkdir /var/www/url-monitor &>> $HOME/codeploylogs.log
sudo chown -R $(whoami):$(whoami) /var/www/url-monitor/ &>> $HOME/codeploylogs.log
sudo chmod +x -R /var/www/url-monitor/ &>> $HOME/codeploylogs.log

