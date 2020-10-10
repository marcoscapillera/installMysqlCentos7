#!/bin/bash
# Description: Set up MySQL Community Release 5.7

echo "se instalara mysql 5.7, espere..."
sleep 3

# Get the repo RPM and install it.
yum localinstall https://dev.mysql.com/get/mysql57-community-release-el7-9.noarch.rpm

# Install the server and start it
yum  install mysql-community-server 


# Get the temporary password
grep 'A temporary password' /var/log/mysqld.log |tail -1

# Set up a batch file with the SQL commands
echo "Debes log con la pass temporal con el siguiente comando mysql -u root -pastemporal"

# Log in to the server with the temporary password, and pass the SQL file to it.
alter user 'root'@'localhost' identified by 'admin123';

service mysqld start
service mysqld status


## localectl set-keymap es
