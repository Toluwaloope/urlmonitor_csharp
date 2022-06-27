#!/bin/bash

cd /var/www/url-monitor &>> $HOME/codeploylogs.log
cp $HOME/* /var/www/url-monitor &>> $HOME/codeploylogs.log
unzip *.zip &>> $HOME/codeploylogs.log
