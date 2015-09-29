[![Stories in Ready](https://badge.waffle.io/ucfpoosd9/UCFClassroom.png?label=ready&title=Ready)](https://waffle.io/ucfpoosd9/UCFClassroom)

## The UCF eLearning Classroom

### Features
<!-- Items commented out have not been completed -->
------------------------------
* Log in with @ucf.edu or @knights.ucf.edu email only
* If @ucf.edu, auto assigned to instructor, else auto assigned to student unless seeded as admin
* Admin has the ability to edit a user and change roles manually if necessary
* Only the admin can edit/create/delete courses
* Only instructor and admin can edit/create/delete assignments

### Development
----------------------------------
* This setup requires [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* This setup also requires the [vagrant-cli](http://docs.vagrantup.com/v2/cli/)
* Clone app to your projects or sites directory

```bash
$ cd path/to/UCFClassroom
$ gem install librian-chef
$ librian-chef install
$ vagrant up
$ vagrant ssh
```

#### This is a basic headless VM setup to get you up and running with rails for the project.
##### Permissions may only be granted to the root user during some steps involving the download of a new ruby version and ruby_build, if this is the case the command `sudo chown -R vagrant.vagrant .rbenv/` may need to be run.

```bash
vagrant@vagrant-ubuntu-trusty-64:~$ sudo apt-get install -y libssl-dev libreadline-dev zlib1g-dev
vagrant@vagrant-ubuntu-trusty-64:~$ sudo git clone git://github.com/sstephenson/rbenv.git .rbenv
vagrant@vagrant-ubuntu-trusty-64:~$ echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
vagrant@vagrant-ubuntu-trusty-64:~$ echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
vagrant@vagrant-ubuntu-trusty-64:~$ sudo git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
vagrant@vagrant-ubuntu-trusty-64:~$ echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bash_profile
vagrant@vagrant-ubuntu-trusty-64:~$ echo "$(<~/.bashrc)" >> ~/.bash_profile
vagrant@vagrant-ubuntu-trusty-64:~$ echo "gem: --no-ri --no-rdoc" > ~/.gemrc
vagrant@vagrant-ubuntu-trusty-64:~$ source ~/.bash_profile
vagrant@vagrant-ubuntu-trusty-64:~$ rbenv install -v 2.2.3
vagrant@vagrant-ubuntu-trusty-64:~$ rbenv global 2.2.3
vagrant@vagrant-ubuntu-trusty-64:~$ gem install bundler
vagrant@vagrant-ubuntu-trusty-64:~$ rbenv rehash
vagrant@vagrant-ubuntu-trusty-64:~$ sudo apt-get install -y mysql-server mysql-client libmysqlclient-dev libpcre3-dev # hit enter for all pink screen questions, these are in regard to the password setup
# Starting Redis
vagrant@vagrant-ubuntu-trusty-64:~$ wget http://download.redis.io/redis-stable.tar.gz
vagrant@vagrant-ubuntu-trusty-64:~$ tar xvzf redis-stable.tar.gz
vagrant@vagrant-ubuntu-trusty-64:~$ cd redis-stable
vagrant@vagrant-ubuntu-trusty-64:~$ make
vagrant@vagrant-ubuntu-trusty-64:~$ cd /srv/UCFClassroom
vagrant@vagrant-ubuntu-trusty-64:/srv/UCFClassroom$ ./bin/setup
# Each of the next three need their own tab/window until we are up with foreman
vagrant@vagrant-ubuntu-trusty-64:/srv/UCFClassroom$ ./bin/cable
vagrant@vagrant-ubuntu-trusty-64:/srv/UCFClassroom$ redis-server
vagrant@vagrant-ubuntu-trusty-64:/srv/UCFClassroom$ ./bin/rails server -b0.0.0.0
```

#### Note the switch from rails stock server to something that can handle http streaming, [Puma](http://puma.io/)


#### To exit your development environment
----------------------------------------------
```bash
 vagrant@vagrant-ubuntu-trusty-64:~$ exit
 $ vagrant halt # <-- this shuts down the VM
 ```
