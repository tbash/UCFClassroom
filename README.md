[![Stories in Ready](https://badge.waffle.io/ucfpoosd9/UCFClassroom.png?label=ready&title=Ready)](https://waffle.io/ucfpoosd9/UCFClassroom)
## The UCF eLearning Classroom

### Development
----------------------------------
* This setup requires [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* This setup also requires the [vagrant-cli](http://docs.vagrantup.com/v2/cli/)
* Clone app to your projects or sites directory
* `$ cd path/to/UCFClassroom`
* `$ vagrant up`
* `$ vagrant ssh`

#### This is a basic headless VM setup to get you up and running with rails for our project, the following could be done by provisioning vagrant but this way could help with one's understanding of some linux commands.
--------------------------------------------------------------------------------------
* `vagrant@vagrant-ubuntu-trusty-64:~$ git clone git://github.com/sstephenson/rbenv.git .rbenv`
* `vagrant@vagrant-ubuntu-trusty-64:~$ echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile`
* `vagrant@vagrant-ubuntu-trusty-64:~$ echo 'eval "$(rbenv init -)"' >> ~/.bash_profile`
* `vagrant@vagrant-ubuntu-trusty-64:~$ git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build`
* `vagrant@vagrant-ubuntu-trusty-64:~$ echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bash_profile`
* `vagrant@vagrant-ubuntu-trusty-64:~$ echo "$(<~/.bashrc)" >> ~/.bash_profile`
* `vagrant@vagrant-ubuntu-trusty-64:~$ source ~/.bash_profile`
* `vagrant@vagrant-ubuntu-trusty-64:~$ rbenv install -v 2.2.2`
* `vagrant@vagrant-ubuntu-trusty-64:~$ rbenv global 2.2.2`
* `vagrant@vagrant-ubuntu-trusty-64:~$ echo "gem: --no-document" > ~/.gemrc`
* `vagrant@vagrant-ubuntu-trusty-64:~$ gem install bundler`
* `vagrant@vagrant-ubuntu-trusty-64:~$ gem install rails`
* `vagrant@vagrant-ubuntu-trusty-64:~$ rbenv rehash`
* `vagrant@vagrant-ubuntu-trusty-64:~$ sudo apt-get install -y mysql-server mysql-client libmysqlclient-dev` (when prompted for password, hit Enter)
* `vagrant@vagrant-ubuntu-trusty-64:~$ sudo apt-get install -y libpcre3-dev`
* `vagrant@vagrant-ubuntu-trusty-64:~$ sudo apt-get install -y nodejs`
* `vagrant@vagrant-ubuntu-trusty-64:~$ cd /srv/UCFClassroom`
* `vagrant@vagrant-ubuntu-trusty-64:/srv/UCFClassroom$ bundle`
* `vagrant@vagrant-ubuntu-trusty-64:/srv/UCFClassroom$ rake db:create db:migrate db:seed`

#### Note the switch from rails stock server to something that can handle http streaming, [Phusion Passenger](https://www.phusionpassenger.com/)

* `vagrant@vagrant-ubuntu-trusty-64:/srv/UCFClassroom$ passenger start`
* Please note that this may take some time to compile, if seeing `Unable to download or extract Nginx source tarball` run this: `vagrant@vagrant-ubuntu-trusty-64:/srv/UCFClassroom$ passenger-config compile-nginx-engine --connect-timeout 60 --idle-timeout 60` and then `vagrant@vagrant-ubuntu-trusty-64:/srv/UCFClassroom$ passenger start`
* launch browser and check it out here: http://33.33.33.104:3000/
* ^C will stop the server

#### To exit your development environment
----------------------------------------------
* `vagrant@vagrant-ubuntu-trusty-64:~$ exit`
* `$ vagrant halt` <-- this shuts down the VM
