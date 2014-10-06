#/bin/bash
sed -i 's/;sendmail_path =/sendmail_path = "\/usr\/bin\/env \/usr\/local\/bin\/catchmail "/g' /etc/php5/apache2/php.ini