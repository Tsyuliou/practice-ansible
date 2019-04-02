#!/bin/bash
sudo yum install -y git
# pre-installetion maven and gradle
# Maven
sudo yum install -y zip unzip
mkdir -p /opt/maven
cd /opt/maven

wget ftp.byfly.by/pub/apache.org/maven/maven-3/3.6.0/binaries/apache-maven-3.6.0-bin.tar.gz
tar xzvf apache-maven-3.6.0-bin.tar.gz --strip 1

sudo ln -s /opt/maven/bin/mvn /usr/bin

mvn --version

# Gradle


wget https://services.gradle.org/distributions/gradle-5.2.1-bin.zip
unzip -d /opt/ gradle-5.2.1-bin.zip
cd /opt/
mv gradle-5.2.1/ gradle/

sudo ln -s /opt/gradle/bin/gradle /usr/bin


gradle -v


# comanda for macke tar.gz tar -czvf custom_name.tar.gz /path/to/file