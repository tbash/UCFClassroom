[![Stories in Ready](https://badge.waffle.io/ucfpoosd9/UCFClassroom.png?label=ready&title=Ready)](https://waffle.io/ucfpoosd9/UCFClassroom)

## UCFClassroom 

### Rolling with an API first design using Rails 5 

### Development (api)

#### Follow these steps to set up initial Dev Environment

* Open up a terminal and run the following:

```sh
$ cd path/to/projects
$ git clone git@github.com:ucfpoosd9/UCFClassroom.git
$ vagrant up 
$ # allow this to boot your vagrant box
$ vagrant ssh
$ cd /srv/UCFClassroom/api
$ bundle
$ # allow bundler to install the gems
$ bin/rails s
```

### Development (client)

* Open up a terminal and run the following:

```sh
$ npm install && bower install
$ ember serve
```
