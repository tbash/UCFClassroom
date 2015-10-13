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

  config.vm.provision "chef_solo" do |chef|
    chef.version = "11.18"
    chef.cookbooks_path = "cookbooks"
    chef.add_recipe 'apt'
    chef.add_recipe 'vim'
    chef.add_recipe 'git'
    chef.add_recipe 'nodejs'
    chef.add_recipe 'redis'
    chef.add_recipe 'nginx'
    chef.json = {
      :nginx => {
        :dir                => "/etc/nginx",
        :log_dir            => "/var/log/nginx",
        :binary             => "/usr/sbin/nginx",
        :user               => "vagrant",
        :init_style         => "runit",
        :pid                => "/var/run/nginx.pid",
        :worker_connections => "1024"
      },
      :redis => {
        :bind        => "127.0.0.1",
        :port        => "6379",
        :config_path => "/etc/redis/redis.conf",
        :daemonize   => "yes",
        :timeout     => "300",
        :loglevel    => "notice"
      }
    }
  end

  # config.vm.provision "shell", inline: <<-SHELL
  #   sudo git clone git://github.com/sstephenson/rbenv.git .rbenv
  #   echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
  #   echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
  #   sudo git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
  #   echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bash_profile
  #   echo "$(<~/.bashrc)" >> ~/.bash_profile
  #   echo "gem: --no-ri --no-rdoc" > ~/.gemrc
  #   source ~/.bash_profile
  #   SHELL
end
