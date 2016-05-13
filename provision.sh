#!/usr/bin/env bash

curl -LSs http://drupalconsole.com/installer | php
mv -v console.phar /usr/local/bin/drupal
