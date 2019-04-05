# Aliaksei Tsyuliou /04.**.2019/

# practice-ansible

### Jenkins+Sonar with postgreSQL+Nexus+Tomcat
### This is a little-lab-environment which can be used in educational goals.
### You can EXEC it in a few ways:
  - When you run command: "vagrant up" in first time environment installed automaticaly. 
  - But if you skip this point, for example you switch off this functional in Vagrantfile you can Run command: "vagrant provision" 
  - Or "ansible-playbook playbook/playbook.yml"
  - If you need deploy in Tomcat use Role deployTomcat: "ansible-playbook playbook/playbook.yml --tags=never"

#### You can read the inventory file here:
[inventory](./inventory)

#### Notice! For correctly work you must create next directory in path when you clone this project: ~/jenkins.data/

#### You can read the Vagrantfile here:
[Vagrantfile](./Vagrantfile)

#### Examples of /etc/hosts and how you can get access to your servers in GUI
```
### add in "/etc/hosts/" next string:
192.168.56.66 jenkins sonar nexus tomcat nginx
### and this services will be available by next links:
http://jenkins/
http://sonar/
http://nexus/
http://tomcat/
```
#### Ip adresses for Servers
```
Main server with jenkins and nginx = 192.168.56.66
SonarServer+PostgreSQL             = 192.168.56.10
NexusServer                        = 192.168.56.20
TomcatServer                       = 192.168.56.30
localhost                          = 192.168.56.1
```

# The following project have next Roles:
### common - in this Role we install all basic dependensy if we need and all common-packages.
#### [common](roles/common)
### constants - in this Role we add vars for all users we want see on our servers. This role used as dependency in role user.
#### [constants](roles/constants)
### deployTomcat - in this Role we deploy in Tomcat use vars which we need to set up and if something failes we Roleback to previous version which we defined earlier too. Not so good as possible, but first sollution which i could realized
  - "ansible-playbook playbook/playbook.yml --tags=never -e fio="set_name" -e last="set_number_of_last_build" -e lt="set_last_success_version"

  - "ansible-playbook playbooks/custom_deploy.yml" to deploy in tomcat.
 
#### [deployTomcat](roles/deployTomcat)

#### java - in this Role we install open-jdk/ version defined in defaults. It Role used in dependency in every Role when we need install java to propertly work.

#### [java](roles/java)

#### jenkins - in this Role we install jenkins server, configure it, create systemd service and start it.

#### [jenkins](roles/jenkins)

#### nexus - in this Role we install nexus, configure, create systemcd service and start it.

#### [nexus](roles/nexus)

#### nginx - in this Role we install nginx server and configure it like proxy server to our services.

#### [nginx](roles/nginx)

#### PostgreSQL - in this Role we install PostgerSQL DataBase and configure it to normally work with sonar. It role used as dependensy in Role sonar.

#### [PostgreSQL](roles/PostgreSQL)

#### sonarServer - in this Role we install sonar server, configure it to propertly work with postgreSQL DB, create systemd service and start it.

#### [sonarServer](roles/sonarServer)

#### tomcat - in this Role we install, and configure Tomcat, version we defined in defaults. Created service for it and started. And ofcource we add user in $tomcat_home/webapps/manager/META_INF/context.xml.

#### [tomcat](roles/tomcat)

#### tools - in thes Role we stupidly install maven and gradle use bash scripte. It role will be depricated in next versions of this Lab-Evieroment. But now it's just bad workground. Sorry for this.

#### [tools](roles/tools)

#### user - use this role we creates users. Their names, id, passwd we defined in Role wen we want create user, and just add this role in roles/name_of_role/meta/main.yml

#### [user](roles/user)

## In directory playbooks we keep all plabooks.
#### [playbooks](playbooks/)

## File ansible.cfg for review

#### [ansible.cfg](./ansible.cfg)

## Custom "bash module"

#### [custom_module](./roles/mylibrary/library)


# If i find time, in this section you'll se facts about all dependency, tools, soft and it versions. But now this sevtion is empty. 
## In you have some questions, review or feedback write here: lexadedok1@mail.ru
