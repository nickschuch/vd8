Vagrant Drupal 8 (vd8)
======================

## Overview

The VD8 project has been created to make sure developers have an easy method for boostrapping a local [Drupal 8](https://www.drupal.org/drupal-8.0) development environment.

## Requirements

### Virtualbox (5.1.x)

Virtualbox can be downloaded and installed from:

https://www.virtualbox.org/wiki/Downloads

### Vagrant (1.9)

Vagrant can be downloaded and installed from:

http://www.vagrantup.com/downloads.html

### Vagrant plugins

```
$ vagrant plugin install vagrant-hostsupdater
$ vagrant plugin install vagrant-auto_network
```
Plugin versions we know work:
* Vagrant Hostupdater: 1.0.2
* Vagrant Auto-network: 1.0.2

### Composer
[Composer](https://getcomposer.org) is a tool for dependency management in PHP. It allows you to declare the libraries your project depends on and it will manage (install/update) them for you.

#### Installation

```bash
# Clone this repo
$ git clone git@github.com:nickschuch/vd8.git
# Get into the folder
$ cd vd8
$ composer install
# Boot the vm
$ vagrant up
...
# Clone Drupal 8.x project on folder app (inside '/vd8' folder)
$ git clone --branch 8.4.x http://git.drupal.org/project/drupal.git app
$ cd app
$ composer install
# Run 'phing install' inside the VM.
$ vagrant ssh
$ phing install
# If you come across incompatibilities with drush while running this command;
# Please use below because drush 8.1.11 incompatibilities with Drupal 8.4.x  
$ composer require drush/drush:9.*
# You can run 'phing reinstall' to reinstall. This command can be run as many
# times as you like. It provides a good workflow for developing and testing.
...
# Now visit http://d8.dev and complete Drupal installation!
```

## Roadmap

* Phing targets.
* Custom packer image to shorten provision time.
