# Webserver configuration.

class drupal {
  
  # EN and DE locales will be generated.
  class { 'locales':
    locales => [
      'en_AU.UTF-8 UTF-8',
      'en_US.UTF-8 UTF-8',
      'en_GB.UTF-8 UTF-8',
    ],
  }

  # Set to Sydney for timezone.
  class { 'timezone':
    timezone => 'Australia/Sydney',
  }

  # Ensure the clock is kept up to date.
  class { '::ntp':
    servers  => [ 'ntp.ubuntu.com' ],
    restrict => ['127.0.0.1'],
  }

  # We want to ensure apt is always updated first.
  class { 'apt':
    always_apt_update => true,
  }

  # Ensure we have an update to date set of packages.
  exec { "apt-update":
    command => "/usr/bin/apt-get update"
  }
  Exec["apt-update"] -> Package <| |>


  include pear
  pear::package { "phing":
    version    => "2.4.13",
    repository => "pear.phing.info",
  }
  pear::package { 'Console_Table': }
  pear::package { 'drush':
    version    => '5.7.0',
    repository => 'pear.drush.org',
  }

  # Include the Drupal webserver configuration.
  include drupal::webserver

}
