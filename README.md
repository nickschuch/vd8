Vagrant Drupal 8 (vd8)
======================

## Overview

The VD8 project has been created to make sure developers have an easy method for boostrapping a local [Drupal 8](https://www.drupal.org/drupal-8.0) development environment.

## Requirements

### Virtualbox (4.3.6)

Virtualbox can be downloaded and installed from:

https://www.virtualbox.org/wiki/Downloads

### Vagrant (1.3 to 1.5)

Vagrant can be downloaded and installed from:

http://www.vagrantup.com/downloads.html

### Vagrant plugins

```
$ vagrant plugin install vagrant-hostsupdater
$ vagrant plugin install vagrant-auto_network
```
Plugin versions we know work:
* Vagrant Hostupdater: 0.0.11
* Vagrant Auto-network: 0.2.1

### Phing
[Phing](http://pear.phing.info/) is a [pear](http://pear.php.net/) package. It is a requirement to install Drupal inside the guest.

#### Installation

```bash
# Clone this repo
$ git clone git@github.com:nickschuch/vd8.git
# Get into the folder
$ cd vd8
# Boot the vm
$ vagrant up
...
# Clone Drupal 8.x project on folder app (inside '/vd8' folder)
$ git clone --branch 8.0.x http://git.drupal.org/project/drupal.git app
# Run 'phing reinstall'
# The above command can be run as many times as you like.
# It provides a good workflow for developing and testing.
$ phing reinstall
...
# Now visit http://d8.dev and complete Drupal installation!
```

## Roadmap

* Phing targets.
* Custom packer image to shorten provision time.
