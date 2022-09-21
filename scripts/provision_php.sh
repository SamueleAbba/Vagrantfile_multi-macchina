#!/bin/bash
echo "php provisioning - begin"
sudo apt-add-repository ppa:ondrej/php
sudo apt-get install php -y
sudo apt-get install php-mysql -y
sudo systemctl restart apache2 #restart apache
echo "php provisioning - end"