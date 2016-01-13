## UCFClassroom

### Prerequisites

####You will need the following things properly installed on your computer.

* [Git](http://git-scm.com/)
* [Node.js](http://nodejs.org/) (with NPM)
* [Ruby](https://www.ruby-lang.org/)
* [Vagrant](https://www.vagrantup.com/)

### Development (api)

* Open up a terminal window and run the following:

```sh
$ cd path/to/projects
$ git clone git@github.com:ucfpoosd9/UCFClassroom.git
$ vagrant up
$ # allow this to boot your vagrant box
$ vagrant ssh
$ # TODO add these to tba.sh
$ sudo touch /etc/init.d/port_swap
$ sudo chmod 777 /etc/init.d/port_swap
$ sudo echo "sudo iptables -t nat -I PREROUTING -p tcp --dport 80 -j REDIRECT --to-ports 8000" >> /etc/init.d/port_swap
$ sudo ln -s /etc/init.d/port_swap /etc/rcS.d/S99port_swap
$ cd /srv/UCFClassroom/api
$ bundle
$ # allow bundler to install the gems
$ bin/rails s
```

### Development (client)

* Open up a terminal and run the following:

```sh
$ cd client/
$ npm install
$ npm start
```
