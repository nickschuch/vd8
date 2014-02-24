Vagrant Drupal 8 (vd8)
======================

## Overview

The VD8 project has been created to make sure developers have an easy method for boostrapping a local Drupal 8 development environment.

## Roadmap

* Phing targets.
* Custom packer image to shorten provision time.

## Install

### Virtualbox

Virtualbox can be downloaded and installed from:

https://www.virtualbox.org/wiki/Downloads

### Vagrant

Vagrant can be downloaded and installed from:

http://www.vagrantup.com/downloads.html

This also required the autonetwork plugin which can be installed by:

```
vagrant plugin install vagrant-auto_network
```

#### Usage

The machine can can be booted by the following command:

```
vagrant up
```

The host will be provisioned with the Puppet manifest by running the following command:

```
vagrant provision
```

More vagrant commands and documenation can be found here:

http://docs.vagrantup.com/v2

## Local DNS

There are many options but the easiest method is to add the following line to your /etc/hosts (or Windows equilent):

```
127.0.0.1    d8.dev
```

## Drupal

Checkout the latest HEAD of Drupal 8:

```
git clone --branch 8.x http://git.drupal.org/project/drupal.git app
```

To install

```
phing reinstall
```

Now (in your browser) go to the below URL and install Drupal 8:

http://d8.dev:8080/core/install.php

## Versions

These are software versions we know work:

* Vagrant: 1.3.5
* Vagrant Auto-network: 0.2.1
* Virtualbox: 4.3.6
