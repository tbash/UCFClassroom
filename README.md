## The UCF eLearning Classroom

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
* `$ sudo apt-get install -y nodejs`
* `$ cd /srv/UCFClassroom`
* `$ bundle`
* `$ rails s -b 0.0.0.0 -p 8000`
* launch browser and check it out here: http://33.33.33.104:8000/


#### To exit your development environment
----------------------------------------------
* `$ exit`
* `$ vagrant halt` <-- this shuts down the VM
