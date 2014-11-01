#!/bin/bash

# PHP
sudo apt-get install -y apache2


# Apache vhost
cd ~
echo '<VirtualHost *:80>
        DocumentRoot /vagrant/www
</VirtualHost>

<Directory "/vagrant/www">
        Options Indexes Followsymlinks
        AllowOverride All
        Require all granted
</Directory>' > vagrant.conf

sudo mv vagrant.conf /etc/apache2/sites-available

# enable apache module
sudo a2enmod rewrite

# Reload apache
sudo a2ensite vagrant
sudo a2dissite 000-default
sudo service apache2 reload
sudo service apache2 restart