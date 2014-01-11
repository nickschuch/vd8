Vagrant Drupal 8
================

## Overview



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

### Puppet

For this project you will require puppet and librarian-puppet. These can be installed by:

```
gem install puppet
gem install librarian-puppet
```

The required puppet modules can then be installed by running:

```
cd puppet && libarian-puppet install
```

## Usage

The machine can can be booted by the following command:

```
vagrant up
```

The host can be provisioned with the Puppet manifest by running the following command:

```
vagrant provision
```

More vagrant commands and documenation can be found here:

http://docs.vagrantup.com/v2

## Versions

These are software versions we know work:

Vagrant: 1.3.5
Vagrant Auto-network: 0.2.1
Virtualbox: 4.3.6
Puppet: 3.4.2
Librarian Puppet: 0.9.10
