#!/bin/bash
echo "MySql provisioning - begin"
sudo apt-get install mysql-server -y

#mysqladmin -u root password root
sudo mysql -e "CREATE USER 'vagrant'@'%' IDENTIFIED BY 'vagrantpass'"
sudo mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'vagrant'@'%' WITH GRANT OPTION"
sudo mysql -e "FLUSH PRIVILEGES"
sudo mysql -e "CREATE DATABASE vagrant"

echo "Updating bind address"
sudo sed -i "s/.*bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/my.cnf
sudo sed -i "s/.*bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf
echo "Restarting mysql service"
sudo systemctl restart mysql
echo "MySql provisioning - end"