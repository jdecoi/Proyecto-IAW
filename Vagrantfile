# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant.configure("2") do |config|
 
  config.vm.box = "ubuntu/xenial64"

  #Nginx
  
  config.vm.define "nginx" do |app|
  app.vm.hostname = "nginx"
  app.vm.network "private_network", ip: "192.168.33.10"
  app.vm.provision "shell", path: "provision/provision_nginx.sh"
end

end