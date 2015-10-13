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
vagrant@dev:~$ sudo apt-get install -y libssl-dev libreadline-dev zlib1g-dev g++
vagrant@dev:~$ sudo git clone git://github.com/sstephenson/rbenv.git .rbenv
vagrant@dev:~$ echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
vagrant@dev:~$ echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
vagrant@dev:~$ sudo git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
vagrant@dev:~$ echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bash_profile
vagrant@dev:~$ echo "$(<~/.bashrc)" >> ~/.bash_profile
vagrant@dev:~$ echo "gem: --no-ri --no-rdoc" > ~/.gemrc
vagrant@dev:~$ source ~/.bash_profile
vagrant@dev:~$ sudo chown -R vagrant.vagrant .rbenv/
vagrant@dev:~$ rbenv install -v 2.2.3
vagrant@dev:~$ rbenv global 2.2.3
vagrant@dev:~$ gem install bundler
vagrant@dev:~$ rbenv rehash
vagrant@dev:~$ sudo apt-get install -y mysql-server mysql-client libmysqlclient-dev libpcre3-dev # hit enter for all pink screen questions, these are in regard to the password setup
vagrant@dev:~$ sudo iptables -t nat -I PREROUTING -p tcp --dport 80 -j REDIRECT --to-ports 3000

# Starting Redis
vagrant@dev:~$ wget http://download.redis.io/redis-stable.tar.gz
vagrant@dev:~$ tar xvzf redis-stable.tar.gz
vagrant@dev:~$ cd redis-stable
vagrant@dev:~$ make
vagrant@dev:~$ cd /srv/UCFClassroom
vagrant@dev:/srv/UCFClassroom$ ./bin/setup
# Each of the next three need their own tab/window until we are up with foreman
vagrant@dev:/srv/UCFClassroom$ ./bin/cable
vagrant@dev:/srv/UCFClassroom$ redis-server
vagrant@dev:/srv/UCFClassroom$ bundle exec rails s
```
#### Now you can visit the app [here](http://dev.ucfclassroom.com/)

#### Note the switch from rails stock server to something that can handle http streaming, [Puma](http://puma.io/)


#### To exit your development environment
----------------------------------------------
```bash
# ^C will exit your server (control + C)
 vagrant@dev:~$ exit
 $ vagrant halt # <-- this shuts down the VM
 ```
