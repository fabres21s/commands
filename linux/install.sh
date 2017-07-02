yum -y install java
firewall-cmd --zone=public --add-port=8080/tcp --permanent

yum -y install haproxy.x86_64

