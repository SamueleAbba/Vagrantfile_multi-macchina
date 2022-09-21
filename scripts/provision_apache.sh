#!/bin/bash
echo "Apache2 provisioning - begin"
sudo apt-get install apache2 -y #install apache
sudo a2enmod rewrite #enable mod_rewrite
sudo systemctl restart apache2 #restart apache
echo "Apache2 provisioning - end"