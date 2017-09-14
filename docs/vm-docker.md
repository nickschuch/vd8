## Docker for local development

In order to use Docker for local development, you will need Docker for Mac Beta 17.05 or above from the [Edge Channel][1]. This version supports the cached volume strategy which makes performance for Drupal acceptable.

### Bash Aliases

The docker-compose files are split based on operating system.

This allows us to do cool things on a "per OS" basis eg. `network_mode: host` for Linux.

Add the following to our bash alias.

**OSX**

```bash
alias dc='docker-compose -f docker-compose.osx.yml'
```

**Linux**

```bash
alias dc='docker-compose -f docker-compose.linux.yml'
```

### Running

You can spin up a local environment with the following command:

```bash
$ dc up -d
```

Then enter that container with:

```bash
$ dc exec php bash
```

### Drupal settings

In order to have the correct db and mailhost host settings you will need to copy `app/sites/default/default.settings.local.docker.php` to `app/sites/default/settings.local.docker.php`

### Browsing the site

The docker site will be avaiable on [http://127.0.0.1/](http://127.0.0.1/)

You can only have one project running at a time.

[1]: https://docs.docker.com/docker-for-mac/install/

### Xdebug

**From the browser**

This will work automatically due to the service "xdebug" declared in the docker-composer.yaml.

This will take all xdebug traffic and forward it onto your OSX laptop.

**From the CLI**

Given xdebug is provided no context of which host to send its xdebug data to, you will need to
set the following configuration on the CLI before running

```bash
export PHP_IDE_CONFIG="serverName=localhost";export XDEBUG_CONFIG="remote_host=192.168.65.1";
```

The IP address 192.168.65.1 is common amongst all Docker for Mac installations
