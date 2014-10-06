#!/bin/bash

sed '/<Directory \/var\/www\/>/,/<\/Directory>/ s/AllowOverride None/AllowOverride all/' /etc/apache2/apache2.conf > /tmp/tmp.~
mv -f /tmp/tmp.~ /etc/apache2/apache2.conf