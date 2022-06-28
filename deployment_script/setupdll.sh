#!/bin/bash

cd /var/www/url-monitor &>> $HOME/codeploylogs.log
cp /home/ubuntu/* /var/www/url-monitor &>> $HOME/codeploylogs.log
unzip *.zip &>> /home/ubuntu/codeploylogs.log
chown -R $(whoami):$(whoami) /var/www/url-monitor/*
