red 'LAMP'
#http://howtoubuntu.org/how-to-install-lamp-on-ubuntu
inst vsftpd
inst apache2
#http://stackoverflow.com/questions/7739645/install-mysql-on-ubuntu-without-password-prompt
inst debconf-utils
pass="pepe"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password $pass"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $pass"
sudo apt-get install -y --force-yes mysql-server
inst php5
inst libapache2-mod-php5
sudo debconf-set-selections <<< 'phpmyadmin phpmyadmin/dbconfig-install boolean true'
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/app-password-confirm password $pass"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/admin-pass password $pass"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/app-pass password $pass"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2"
sudo apt-get install -y --force-yes phpmyadmin # quizas: http://stackoverflow.com/questions/20731487/phpmyadmin-pma-table-uiprefs-doesnt-exist

sudo /etc/init.d/apache2 restart
rm -f /tmp/index.html
wget -q http://localhost -O /tmp/index.html
if [[ -f /tmp/index.html ]]; then red 'apache works!'; else red 'index.html not present :('; fi
if [[ $(php -r 'echo "OK";') = 'OK' ]]; then red 'php works!'; else red 'php error'; fi

red 'fin - LAMP'