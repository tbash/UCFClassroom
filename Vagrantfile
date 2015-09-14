# -*- mode: ruby -*-
# vi: set ft=ruby :

APP_NAME = "UCFClassroom"

Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/trusty64"
  config.vm.box_url = "https://github.com/kraksoft/vagrant-box-ubuntu/releases/download/14.04/ubuntu-14.04-amd64.box"
  config.vm.box_check_update = false

  config.vm.network "private_network", ip: "33.33.33.104"
  config.vm.network "forwarded_port", guest: 9000, host: 9000

  config.vm.synced_folder ".", "/srv/UCFClassroom"

  config.vm.provider "virtualbox" do |vb|
    vb.cpus = "2"
    vb.memory = "2048"
  end

  config.vm.provision "shell", inline: <<-SHELL
    sudo apt-get update
    sudo apt-get install -y git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev
    # git clone git://github.com/sstephenson/rbenv.git .rbenv
    # echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
    # echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
    # git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
    # echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bash_profile
    # sudo echo "$(<~/.bashrc)" >> ~/.bash_profile
    # source ~/.bash_profile
    # rbenv install -v 2.2.2
    # rbenv global 2.2.2
    # gem install bundler
    # gem install rails
    # rbenv rehash
    # sudo apt-get install -y mysql-server mysql-client libmysqlclient-dev
    # sudo apt-get install -y nodejs
  SHELL

end
