Vagrant.configure("2") do |config|  
  config.vm.box = "sbeliakou/centos"
  config.vm.box_version = "7.6"

  config.vm.define "Jenkins" do |kub|
    kub.vm.synced_folder "./jenkins.data", "/opt/jenkins", create: true,
    mount_options: ["uid=1212", "gid=1212"]
    kub.vm.network :private_network, ip: "192.168.56.66"
    kub.vm.hostname = "Fun-with-Jenkins"  
    kub.ssh.insert_key = false
    kub.vm.provider "virtualbox" do |vb|     
        vb.name = "Fun-with-Jenkins"
        vb.customize ["modifyvm", :id, "--cpuexecutioncap", "40"]
        vb.memory = "4096" 
  end
    end

      # end
  config.vm.define "Node-1" do |big|
  	big.vm.network :private_network, ip: "192.168.56.10"
  	big.vm.hostname = "Node-1"
  	big.ssh.insert_key = false
    big.vm.provider "virtualbox" do |ss|
    ss.name = "Node-1"
        ss.customize ["modifyvm", :id, "--cpuexecutioncap", "15"]
        ss.memory = "2048" 
  end
    end  
  
  config.vm.define "Node-2" do |bang|
  	bang.vm.network :private_network, ip: "192.168.56.20"
  	bang.vm.hostname = "Node-2"
  	bang.ssh.insert_key = false
    bang.vm.provider "virtualbox" do |cc|
    cc.name = "Node-2"
        cc.customize ["modifyvm", :id, "--cpuexecutioncap", "15"]
        cc.memory = "2048" 
    end
    end

  config.vm.define "Node-3" do |boom|
    boom.vm.network :private_network, ip: "192.168.56.30"
    boom.vm.hostname = "Node-3"
    boom.ssh.insert_key = false
    boom.vm.provider "virtualbox" do |svc|
    svc.name = "Node-3"
        svc.customize ["modifyvm", :id, "--cpuexecutioncap", "15"]
        svc.memory = "2048" 
  end
  

    boom.vm.provision :ansible do |ansible|
        ansible.limit = "all"
        ansible.playbook = "playbooks/playbook.yml"
        ansible.inventory_path = "./inventory"        
        ansible.raw_arguments  = [
"--connection=paramiko"]     
    end
  end
end
