# The packages Drupal 8 requires.

class drupal::packages {
  # Repositories.
  apt::ppa { "ppa:ondrej/php5-oldstable": }

  # Packages.
  package { 'php5-gd':     ensure => 'installed' }
  package { 'php5-mcrypt': ensure => 'installed' }
  package { 'php5-curl':   ensure => 'installed' }

  # We want to ensure apt is always updated first.
  class { 'apt':
    always_apt_update => true,
  }

  # Ensure we have an update to date set of packages.
  exec { "apt-update":
    command => "/usr/bin/apt-get update"
  }
  Exec["apt-update"] -> Package <| |>
}
