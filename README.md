django-project-template
=======================

Features:
 * deploy script for deployment to debian/ubuntu (with nginx, supervisor, fastcgi) servers via rsync
 * all system configs (cron, logrotate, etc) located in project folder system/ and symlinked after deploy
 * virualenv for developer and production
 * `system/requirements.txt` for pip and system/debian.txt for debian packages
 * shortcut `runserver-dev.sh` (with `localsettings.py` inherited from `settings.py`)
 * shortcut `test-dev.sh` for testing (PEP8 checking inside, `testsettings.py` inherited from `localsettings.py`)
 * one simple page ("It works!") out of the box (ideal for one-page django expetiments)
 * folders for commands and templatetags
 * .gitignore and .hgignore
 * etc

Mac OS X prerequirements:
```shell
brew install python nodejs
npm install -g bower
```

Ubuntu/Debian prerequirements:
```shell
sudo apt-get install -y python-dev nodejs npm
npm install -g bower
```

Usage:
```shell
read -p "Enter app name: " appname && django-admin.py startproject --template=http://goo.gl/r6sAa -e sh,conf,sql -n base.html ${appname} && cd ${appname} && find . -name \*.sh -type f -exec chmod +x {} \; && chmod +x src/manage.py && rm README.md && ./upgrade-requirements.sh && ./runserver-dev.sh
```

Conventions:
 * suffix "-dev" = "for development only"
