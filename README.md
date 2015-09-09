[![Stories in Ready](https://badge.waffle.io/ucfpoosd9/UCFClassroom.png?label=ready&title=Ready)](https://waffle.io/ucfpoosd9/UCFClassroom)
## The UCF eLearning Classroom

### Quick start
--------------------------
#### If you don't want to go through this quite yet, you could simply clone and run `$ bundle && rails s` from the UCFClassroom dir and go to http://localhost:3000/, provided you have ruby, rails, and bundler. This will not allow streaming and is not advised as the environment setup below will be most like the production environment.

### Development
----------------------------------
* This setup requires [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* This setup also requires the [vagrant-cli](http://docs.vagrantup.com/v2/cli/)
* Clone app to your projects or sites directory
* `$ cd path/to/UCFClassroom`
* `$ vagrant up`
* `$ vagrant ssh`

#### This is a basic headless VM setup to get you up and running with rails for our project, this could be done by provisioning but this way could help with one's understanding of some linux commands
--------------------------------------------------------------------------------------
* `$ git clone git://github.com/sstephenson/rbenv.git .rbenv`
* `$ echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile`
* `$ echo 'eval "$(rbenv init -)"' >> ~/.bash_profile`
* `$ git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build`
* `$ echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bash_profile`
* `$ echo "$(<~/.bashrc)" >> ~/.bash_profile`
* `$ source ~/.bash_profile`
* `$ rbenv install -v 2.2.2`
* `$ rbenv global 2.2.2`
* `$ echo "gem: --no-document" > ~/.gemrc`
* `$ gem install bundler`
* `$ gem install rails`
* `$ rbenv rehash`
* `$ sudo apt-get install -y mysql-server mysql-client libmysqlclient-dev` (when prompted for password, hit Enter)
* `$ sudo apt-get install -y libpcre3-dev`
* `$ sudo apt-get install -y nodejs`
* `$ cd /srv/UCFClassroom`
* `$ bundle`
* `$ rake db:create db:migrate db:seed` (have not created any seeds yet)

#### Note the switch from rails stock server to something that can handle http streaming, [Phusion Passenger](https://www.phusionpassenger.com/)

* `$ passenger start`
* Please not that this may take some time to compile, if seeing `Unable to download or extract Nginx source tarball` run this: `$ passenger-config compile-nginx-engine --connect-timeout 60 --idle-timeout 60` and then `$ passenger start`
* launch browser and check it out here: http://33.33.33.104:3000/
* ^C will stop the server

#### To exit your development environment
----------------------------------------------
* `$ exit`
* `$ vagrant halt` <-- this shuts down the VM
