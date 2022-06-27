#!/bin/bash

sudo cd /etc/apache2/sites-available/ >> $HOME/codeploylogs.log

sudo cat > /etc/apache2/sites-available/url-monitor.conf << EOF
<VirtualHost *:80>
ServerAdmin admin@localhost
ServerName example.com
ServerAlias www.example.com
DocumentRoot /var/www/url-monitor
ErrorLog ${APACHE_LOG_DIR}/error.log
CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
EOL

sudo cat /etc/apache2/sites-available/url-monitor.conf >> $HOME/codeploylogs.log

sudo a2ensite url-monitor.conf 

sudo cat > /etc/systemd/system/url-monitor.service << EOF

[Unit]
Description= Url monitor service with .NET Web app running on Ubuntu

[Service]
WorkingDirectory=/var/www/url-monitor
ExecStart= sudo dotnet /var/www/url-monitor/urlmonitor.dll
Restart=always
RestartSec=10
KillSignal=SIGINT
SyslogIdentifier=url-monitor
User=apache
Environment=ASPNETCORE-ENVIRONEMT=Development

[Install]
WantedBy=multi-user.target
EOL

sudo cat /etc/systemd/system/url-monitor.service >> $HOME/codeploylogs.log

