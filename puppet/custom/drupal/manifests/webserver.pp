# A webserver class.

class drupal::webserver (
  $port                = "8080",
  $display_errors      = false,
  $memory_limit        = '256M',
  $post_max_size       = '20M',
  $upload_max_filesize = '20M',
  $max_execution_time  = '300',
  $date_timezone       = 'Australia/Sydney',
  $error_log           = 'syslog',
) {

  # Apache.
  class { 'apache':
    default_vhost => false,
    mpm_module    => 'prefork',
  }
  apache::listen { $port: }
  apache::mod { 'php5': }
  apache::mod { 'rewrite': }
  apache::mod { 'headers': }

  # Drupal requires php5-gd.
  package { 'php5-gd': ensure => 'installed' }
  package { 'php5-mcrypt': ensure => 'installed' }
  package { 'php5-curl': ensure => 'installed' }

  # PHP.
  class { 'php::mod_php5': inifile => '/etc/php5/apache2/php.ini' }
  php::ini { '/etc/php5/apache2/php.ini':
    display_errors      => $display_errors,
    memory_limit        => $memory_limit,
    post_max_size       => $post_max_size,
    upload_max_filesize => $upload_max_filesize,
    max_execution_time  => $max_execution_time,
    date_timezone       => $date_timezone,
    error_log           => $error_log,
    require             => Package['libapache2-mod-php5'],
  }
  php::ini { '/etc/php5/cli/php.ini':
    display_errors      => $display_errors,
    memory_limit        => $memory_limit,
    post_max_size       => $post_max_size,
    upload_max_filesize => $upload_max_filesize,
    max_execution_time  => $max_execution_time,
    date_timezone       => $date_timezone,
    error_log           => $error_log,
  }
  
  # Mysql.
  class { 'mysql::server':
    # The following has been added so we can access the database
    # from our Vagrant host.
    override_options => {
      'mysqld' => {
        'bind_address' => '0.0.0.0',
      }
    }
  }
  include 'mysql::server::mysqltuner'
  include 'mysql::client'
  class { 'mysql::bindings':
    php_enable => true,
  }

}
