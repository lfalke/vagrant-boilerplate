#!/bin/bash

sudo add-apt-repository ppa:ondrej/php5-5.6
sudo apt-get update -y
sudo apt-get install -y php5 php5-dev libapache2-mod-php5 php5-mysql php5-curl php5-json php5-mcrypt libpcre3-dev

# Enable PHP modules
sudo php5enmod curl
sudo php5enmod mcrypt

# Update some PHP Error Reporting
sudo sed -i 's/error_reporting = E_ALL & ~E_DEPRECATED & ~E_STRICT/error_reporting = E_ALL/' /etc/php5/apache2/php.ini
sudo sed -i 's/display_errors = Off/display_errors = On/' /etc/php5/apache2/php.ini 

# Install Composer for PHP
sudo curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer.phar
alias composer='/usr/local/bin/composer.phar'