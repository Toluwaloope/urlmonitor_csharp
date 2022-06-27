#!/bin/bash

sudo systemctl stop apache2 &>> $HOME/codeploylogs.log

sudo systemctl stop url-monitor.service &>> $HOME/codeploylogs.log

chmod +x *.sh &>> $HOME/codeploylogs.log
