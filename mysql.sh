#!/usr/bin/env bash
rpm --import https://repo.mysql.com/RPM-GPG-KEY-mysql-2022
yum localinstall https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm -y
yum install mysql-community-server -y
systemctl start mysqld 

grep 'A temporary password' /var/log/mysqld.log |tail -1
/usr/bin/mysql_secure_installationmysql_secure_installation