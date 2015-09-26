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
vagrant@vagrant-ubuntu-trusty-64:/srv/UCFClassroom$ bundle
vagrant@vagrant-ubuntu-trusty-64:/srv/UCFClassroom$ rake db:create db:migrate db:seed
```
##### Permissions may only be granted to the root user during some steps involving the download of a new ruby version and ruby_build, if this is the case the command `sudo chown -R vagrant.vagrant .rbenv/` may need to be run.

#### Note the switch from rails stock server to something that can handle http streaming, [Phusion Passenger](https://www.phusionpassenger.com/)

* `vagrant@vagrant-ubuntu-trusty-64:/srv/UCFClassroom$ passenger start`
* Answer `n` to `Compile with optimizations? [y/n]:`
* Please note that this may take some time to compile, if seeing `Unable to download or extract Nginx source tarball` run this: `vagrant@vagrant-ubuntu-trusty-64:/srv/UCFClassroom$ passenger-config compile-nginx-engine --connect-timeout 60 --idle-timeout 60`
* `vagrant@vagrant-ubuntu-trusty-64:/srv/UCFClassroom$ passenger-install-nginx-module`

##### These steps can be skipped if you want but you may have to start nginx manually at each start be running `sudo service nginx start`

```
# Download nginx startup script
wget -O init-deb.sh https://www.linode.com/docs/assets/660-init-deb.sh

# Move the script to the init.d directory & make executable
sudo mv init-deb.sh /etc/init.d/nginx
sudo chmod +x /etc/init.d/nginx

# Add nginx to the system startup
sudo /usr/sbin/update-rc.d -f nginx defaults
```

* `vagrant@vagrant-ubuntu-trusty-64:/srv/UCFClassroom$ passenger start`
* launch browser and check it out here: http://33.33.33.104:3000/
* ^C will stop the server

#### To exit your development environment
----------------------------------------------
* `vagrant@vagrant-ubuntu-trusty-64:~$ exit`
* `$ vagrant halt` <-- this shuts down the VM
