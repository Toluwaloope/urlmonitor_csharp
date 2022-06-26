#!/bin/bash

sudo systemctl start url-monitor.service

sudo systemctl start apache2

sudo systemctl enable url-monitor.service

sudo systemctl enable apache2
