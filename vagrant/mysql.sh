#!/bin/bash

# MySQL with root:secret
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password secret'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password secret'
sudo apt-get install -q -y mysql-server-5.5 
# sudo apt-get install -q -y mysql-client-5.5

# MySQL Configuration
# Allow us to Remote from Vagrant with Port
sudo sed -i 's/bind-address/bind-address = 0.0.0.0#/' /etc/mysql/my.cnf

# Grant All Priveleges to ROOT for remote access
mysql --user=root --password=secret -Bse "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '' WITH GRANT OPTION;"

# restart mysql service
sudo service mysql restart