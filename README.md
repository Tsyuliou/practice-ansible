# Aliaksei Tsyuliou /04.**.2019/

# practice-ansible

### Jenkins+Sonar with postgreSQL+Nexus+Tomcat
### This is a little-lab-environment which can be used in educational goals.

#You can EXEC it in a few ways
##1 
###When you run command: "vagrant up" in first time environment installed automaticaly. 
##2
###But if you skip this point, for example you switch off this functional in Vagrantfile you can Run command: "vagrant provision" 
##3
###Or "ansible-playbook playbook/playbook.yml"
##4
### If you need deploy in Tomcat use Role deployTomcat: "ansible-playbook playbook/playbook.yml --tags=never"

####You can read the inventory file here:
[inventory](./inventory)

####Notice! For correctly work you must create next directory in path when you clone this project: ~/jenkins.data/

####You can read the Vagrantfile here:
[Vagrantfile](./Vagrantfile)

####Examples of /etc/hosts and how you can get access to your servers in GUI
```
### add in "/etc/hosts/" next string:
192.168.56.66 jenkins sonar nexus tomcat nginx
### and this services will be available by next links:
http://jenkins/
http://sonar/
http://nexus/
http://tomcat/
```
####Ip adresses for Servers
```
Main server with jenkins and nginx = 192.168.56.66
SonarServer+PostgreSQL             = 192.168.56.10
NexusServer                        = 192.168.56.20
TomcatServer                       = 192.168.56.30
localhost                          = 192.168.56.1
```

#The following project have next Roles:
###common - in this Role we install all basic dependensy if we need and all common-packages.
[common](roles/common)
###constants - in this Role we add vars for all users we want see on our servers
[constants](roles/constants)
###deployTomcat - in this Role we deploy in Tomcat use vars which we need to set up and if something failes we Roleback to previous version which we defined earlier too. Not so good as possible, but first sollution which i could realized
###"ansible-playbook playbook/playbook.yml --tags=never -e fio="set_name" -e last="set_number_of_last_build" -e lt="set_last_success_version"
[deployTomcat](roles/deployTomcat)

