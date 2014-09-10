Vagrant Drupal 8 (vd8)
======================

## Overview

The VD8 project has been created to make sure developers have an easy method for boostrapping a local Drupal 8 development environment.

## Roadmap

* Phing targets.
* Custom packer image to shorten provision time.

## Requirements

### Virtualbox (4.3.6)

Virtualbox can be downloaded and installed from:

https://www.virtualbox.org/wiki/Downloads

### Vagrant (1.3 to 1.5)

Vagrant can be downloaded and installed from:

http://www.vagrantup.com/downloads.html

This also required the autonetwork and hostsupdater plugins which can be installed by:

```
$ vagrant plugin install vagrant-hostsupdater
$ vagrant plugin install vagrant-auto_network
```

#### Plugins

These are software versions we know work:

* Vagrant Hostupdater: 0.0.11
* Vagrant Auto-network: 0.2.1

#### Usage

The machine can can be booted by the following command:

```
$ vagrant up
```

The host will be provisioned automatically on the first `vagrant up`. If you
wish to rerun the provision that can be done with the following command:

```
$ vagrant provision
```

More vagrant commands and documenation can be found here:

http://docs.vagrantup.com/v2

## Local DNS

WE REQUIRE THE "Vagrant Auto-network" PLUGIN AS MENTIONED ABOVE.

## Drupal

Checkout the latest HEAD of Drupal 8:

```
$ git clone --branch 8.0.x http://git.drupal.org/project/drupal.git app
```

To install

```
$ phing reinstall
```

The above command can be run as many times as you like. It provides a good
workflow for developing and testing.
