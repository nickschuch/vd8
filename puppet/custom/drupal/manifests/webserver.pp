# A webserver class.

class drupal::webserver (
  $port = $drupal::params::port,
) {
  class { 'apache':
    default_vhost => false,
    mpm_module    => 'prefork',
  }
  apache::listen { $port: }
  apache::mod { 'php5': }
  apache::mod { 'rewrite': }
  apache::mod { 'headers': }
}
