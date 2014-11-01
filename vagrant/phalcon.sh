#!/bin/bash

sudo apt-get install -y git gcc make libpcre3-dev

cd ~
git clone --depth=1 --single-branch https://github.com/phalcon/cphalcon.git -b 2.0.0 cphalcon-2.0.0/
cd cphalcon-2.0.0/ext
sudo ./install


echo "extension=phalcon.so" > phalcon.ini
sudo mv phalcon.ini /etc/php5/mods-available

# enable phalcon php module
sudo php5enmod phalcon

cd ~
sudo rm -rf cphalcon-2.0.0