#!/bin/bash
# Description: Set up MySQL Community Release 5.7

# Get the repo RPM and install it.
yum localinstall https://dev.mysql.com/get/mysql57-community-release-el7-9.noarch.rpm

# Install the server and start it
yum -y install mysql-community-server 


# Get the temporary password
temp_password=$(grep password /var/log/mysqld.log | awk '{print $NF}')

# Set up a batch file with the SQL commands
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY 'Welcome-123'; flush privileges;" > reset_pass.sql

# Log in to the server with the temporary password, and pass the SQL file to it.
mysql -u root --password="$temp_password" --connect-expired-password < reset_pass.sql

service mysqld start
service mysqld status


## localectl set-keymap es
