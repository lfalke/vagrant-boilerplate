# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"

  # Create a private network and forward some ports
  # config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.network "forwarded_port", guest: 80, host: 5000

  # Shared folders
  config.vm.synced_folder "./www", "/vagrant/www/", :mount_options => [ "dmode=775", "fmode=644" ], :owner => 'www-data', :group => 'www-data'

  # Virtualbox settings
  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "500"]
  end

  # Provisioning script
  config.vm.provision "shell", path: "vagrant/init.sh"
  config.vm.provision "shell", path: "vagrant/mysql.sh"
  config.vm.provision "shell", path: "vagrant/php.sh"
  config.vm.provision "shell", path: "vagrant/phalcon.sh"
  config.vm.provision "shell", path: "vagrant/apache.sh"
  # config.vm.provision "shell", path: "vagrant/nginx.sh"
  config.vm.provision "shell", inline: "echo 'vagrant setup finsihed. Enjoy!'"

end
