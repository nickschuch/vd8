#!/usr/bin/make -f

APP_ROOT=$(CURDIR)/app
PHP=$(which php)
PHPCS_EXTENSIONS=php,module,inc,install,test,profile,theme
PHPCS_IGNORE=*.md,*.css,*.txt
PHPCS_COMMON_OPTIONS=--standard=vendor/drupal/coder/coder_sniffer/Drupal/ruleset.xml --extensions=$(PHPCS_EXTENSIONS) --ignore=$(PHPCS_IGNORE)
BUILD_LOGS_DIR=$(CURDIR)/build/logs
ARCH=$(shell uname -m)
APP_URL=http://d8.dev
BROWSERTEST_OUTPUT_DIRECTORY=$(APP_ROOT)/sites/default/files
PHANTOMJS_DIR=$(HOME)/.phantomjs
PHANTOMJS_BIN=$(HOME)/.phantomjs/phantomjs-2.1.1-linux-$(ARCH)/bin/phantomjs
DRUSH=$(CURDIR)/bin/drush
DC=$(CURDIR)/bin/drupal
SITE_NAME=Drupal8
EMAIL=admin@d8.dev
USERNAME=admin
PASSWORD=password
PROFILE=standard
MODULES_ENABLE=0
MYSQL_HOST=d8.dev
MYSQL_PORT=3306
MYSQL_DATABASE=local
MYSQL_USER=drupal
MYSQL_PASS=drupal
MYSQL_QUERY_STRING=mysql://$(MYSQL_USER):$(MYSQL_PASS)@$(MYSQL_HOST)/$(MYSQL_DATABASE)
list:
	@$(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1n}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'

prepare:
	composer install --prefer-dist

install:
	$(DRUSH) -r $(APP_ROOT) site-install $(PROFILE) -y --db-url=$(MYSQL_QUERY_STRING) --account-mail=$(EMAIL) --account-name=$(USERNAME) --account-pass=$(PASSWORD) --site-name=$(SITE_NAME) install_configure_form.site_default_country=AU install_configure_form.date_default_timezone=Australia/Sydney

re-install: db-drop clean-up copy-files install simple-enable login

clean-up:
	rm -fR $(APP_ROOT)/sites/default/files/*

copy-files:
	cp $(APP_ROOT)/sites/default/default.settings.php $(APP_ROOT)/sites/default/settings.php
	chmod 777 $(APP_ROOT)/sites/default/settings.php
	cp $(APP_ROOT)/sites/default/default.services.yml $(APP_ROOT)/sites/default/services.yml
	chmod 777 $(APP_ROOT)/sites/default/services.yml

db-drop:
	$(DRUSH) -r $(APP_ROOT) sql-drop -y

simple-enable:
	$(DRUSH) -r $(APP_ROOT) en simpletest --uri=$(APP_URL) -y

simple-test:
	@while [ -z "$$CLASS" ]; do \
		read -r -p "Class name: " CLASS; \
	done ; \
	$(PHP) $(APP_ROOT)/core/scripts/run-tests.sh --php $(PHP) --concurrency 12 --url $(APP_URL)  --verbose --color --class '$$CLASS'

test:
	$(APP_ROOT)/vendor/bin/phpunit -d -v -c $(APP_ROOT)/core/phpunit.xml.dist;cat $(APP_ROOT)/test-output.html;echo "" > $(APP_ROOT)/test-output.html

test-filter:
	@while [ -z "$$GROUP" ]; do \
		read -r -p "Filter group: " GROUP; \
	done ; \
	$(APP_ROOT)/vendor/bin/phpunit -c $(APP_ROOT)/core/phpunit.xml.dist --filter=$$GROUP;cat $(APP_ROOT)/test-output.html;echo "" > $(APP_ROOT)/test-output.html

login:
	$(DRUSH) -r $(APP_ROOT) uli --uri=$(APP_URL)

phpcbf:
	@while [ -z "$$FOLDER" ]; do \
		read -r -p "Folder path: " FOLDER; \
	done ; \
	$(CURDIR)/bin/phpcbf --report=full $(PHPCS_COMMON_OPTIONS) $$FOLDER

phpcs:
	@while [ -z "$$FOLDER" ]; do \
		read -r -p "Folder path: " FOLDER; \
	done ; \
	$(CURDIR)/bin/phpcs --report=full $(PHPCS_COMMON_OPTIONS) $$FOLDER