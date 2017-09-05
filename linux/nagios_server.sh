#### Instalación de Nagios Server en Centos 7

#### Instalación de LAMP

yum install httpd -y
systemctl start httpd
systemctl enable httpd
firewall-cmd --permanent --add-service=http
systemctl restart firewalld

### buscar instalación de mysql
yum install mariadb-server mariadb -y
systemctl start mysqld
systemctl enable mysqld


yum install php php-mysql php-gd php-pear -y


yum install gd gd-devel gcc glibc glibc-common wget

wget https://assets.nagios.com/downloads/nagiosfusion/fusion-latest.tar.gz
tar xzf fusion-latest.tar.gz
https://assets.nagios.com/downloads/nagioscore/docs/Nagios-Core-Installing-On-Centos7.pdf
