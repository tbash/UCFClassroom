# encoding: utf-8

# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/trusty64"
  config.ssh.forward_agent = true

  config.vm.network "private_network", ip: "33.33.33.104"
  config.vm.network "forwarded_port", guest: 9000, host: 9000

  config.vm.synced_folder ".", "/srv/UCFClassroom"

  config.vm.hostname = 'dev.ucfclassroom.com'
  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true

  config.vm.provider "virtualbox" do |vb|
    vb.cpus = "2"
    vb.memory = "2048"
  end
  config.vm.provision :shell, path: 'bootstrap.sh', keep_color: true
end
