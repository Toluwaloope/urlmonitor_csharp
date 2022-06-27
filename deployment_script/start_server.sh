#!/bin/bash

sudo systemctl start url-monitor.service &>> $HOME/codeploylogs.log

sudo systemctl start apache2 &>> $HOME/codeploylogs.log

sudo systemctl enable url-monitor.service &>> $HOME/codeploylogs.log

sudo systemctl enable apache2 &>> $HOME/codeploylogs.log
