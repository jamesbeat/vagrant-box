#!/bin/bash
/usr/local/bin/composer global require drush/drush:dev-master
sudo ln -sf $HOME/.composer/vendor/drush/drush /usr/bin/drush
echo "export PATH=$PATH:/usr/bin/drush" >> $HOME/.bashrc