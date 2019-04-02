#!/bin/bash

#pre-install
yum install httpd-devel apr apr-devel apr-util \
apr-util-devel gcc gcc-c++ make autoconf libtool -y
# java-1.8.0-openjdk-devel -y

mkdir -p /opt/tomcat
#download tomcat
cd /tmp
p="tomcat"
useradd tomcat
echo $p | passwd tomcat --stdin
wget http://ftp.byfly.by/pub/apache.org/tomcat/tomcat-9/v9.0.16/bin/apache-tomcat-9.0.16.tar.gz
sleep 15
tar -xf apache-tomcat-9.0.16.tar.gz
sleep 5
mv /tmp/apache-tomcat-9.0.16/* /opt/tomcat
#ln -s /opt/tomcat/apache-tomcat-9.0.14 /opt/tomcat/latest
chown -R tomcat: /opt/tomcat
chmod +x -R /opt/tomcat/bin/*.sh
#chmod +x -R /opt/tomcat/apache-tomcat-9.0.14/bin/*

# add permissions to all directories and change owner:group
echo " 
[Unit]
Description=Tomcat 9 servlet container
After=network.target

[Service]
Type=forking

User=tomcat
Group=tomcat

Environment=JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.201.b09-2.el7_6.x86_64/jre
#Environment=JAVA_OPTS=-Djava.security.egd=file:///dev/urandom

#Environment=CATALINA_BASE=/opt/tomcat
Environment=CATALINA_HOME=/opt/tomcat
Environment=CATALINA_PID=/opt/tomcat/temp/tomcat.pid
#Environment=CATALINA_OPTS=-Xms512M -Xmx1024M -server -XX:+UseParallelGC

ExecStart=/opt/tomcat/bin/catalina.sh start
ExecStop=/opt/tomcat/bin/catalina.sh stop

[Install]
WantedBy=multi-user.target" > /etc/systemd/system/tomcat.service


#alternatives --config java <<< '1'

sleep 5

systemctl daemon-reload

sleep 3

systemctl enable tomcat
systemctl start tomcat
systemctl status tomcat
 
#TASK
#sleep 10 
#bash /vagrant/mv.sh



















