# Pear related configuration and packages.

class drupal::pear {
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
}
