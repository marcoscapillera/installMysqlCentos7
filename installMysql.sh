#!/bin/bash
#yum localinstall https://dev.mysql.com/get/mysql57-community-release-el7-9.noarch.rpm
yum localinstall https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm

read -p "Presione enter para continuar"
yum install mysql-community-server
read -p "Presione enter para continuar"
service mysqld start
#grep 'A temporary password' /var/log/mysqld.log |tail -1

#read -p "Ingrese a mysql con mysql -u root -p passwordtemp"
#mysql -u root -ppassword
#alter user 'root'@'localhost' identified by 'password';



## localectl set-keymap es
