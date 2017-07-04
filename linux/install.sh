yum -y install java
firewall-cmd --zone=public --add-port=8080/tcp --permanent

yum -y install haproxy.x86_64


### para habilitar haproxy en cualquier otro puerto
setsebool -P haproxy_connect_any=1
