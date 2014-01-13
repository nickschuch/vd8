# A webserver class.

class drupal::webserver (
  $port = $drupal::params::port,
) {
  class { 'apache':
    default_vhost => false,
    mpm_module    => 'prefork',
  }
  apache::listen { $port: }
  # apache::mod { 'php5': }
  apache::mod { 'rewrite': }
  apache::mod { 'headers': }

  # @todo, work out how we can remove this symlink.
  file { "${apache::params::httpd_dir}/modules":
    ensure  => 'link',
    target  => $apache::params::lib_path,
    require => Class['apache'],
    notify  => Service['httpd'],
  }
}
