
Vagrant.configure("2") do |config|
  
  BOX_IMAGE = "ubuntu/jammy64"
  BASE_NETWORK = "10.10.20"
  
  PROXY_ENABLE = false
  PROXY_HTTP = "http://10.0.2.2:5865"
  PROXY_HTTPS = "http://10.0.2.2:5865"
  PROXY_EXCLUDE = "localhost,127.0.0.1"
  
  BOX_CHK_UPDATE = false
  SSH_INSERT_KEY = false
  PROXY_ENABLE = false
  VB_CHK_UPDATE = false
  
  config.vm.define "web" do |subconfig|
	subconfig.vm.box = BOX_IMAGE
	subconfig.proxy.http = PROXY_HTTP
	subconfig.proxy.https = PROXY_HTTPS
	subconfig.proxy.no_proxy = PROXY_EXCLUDE
	subconfig.vm.network "private_network", ip: "10.10.20.10", virtualbox__intnet: true
	subconfig.vm.network "forwarded_port", guest: 80, host: 9080
	subconfig.vm.hostname = "mmweb.cpt.local"
	subconfig.vm.provider "virtualbox" do |vb|
		vb.name = "MMWeb"
		vb.memory = "2048"
		vb.cpus = 1
		vb.customize ["modifyvm", :id, "--uart1", "0x3F8", "4"]
		vb.customize ["modifyvm", :id, "--uartmode1", "file", File::NULL]
	end
	subconfig.vm.box_check_update = BOX_CHK_UPDATE
	subconfig.ssh.insert_key = SSH_INSERT_KEY
	if Vagrant.has_plugin?("vagrant-vbguest")
		subconfig.vbguest.auto_update = VB_CHK_UPDATE
	end
	#provisioning
	subconfig.vm.provision "shell", path: "./scripts/provision_update.sh"
	subconfig.vm.provision "shell", path: "./scripts/provision_apache.sh"
	subconfig.vm.provision "shell", path: "./scripts/provision_php.sh"
	subconfig.vm.synced_folder "www/", "/var/www/html"
  end
  config.vm.define "db" do |subconfig|
	subconfig.vm.box = BOX_IMAGE
	subconfig.proxy.http = PROXY_HTTP
	subconfig.proxy.https = PROXY_HTTPS
	subconfig.proxy.no_proxy = PROXY_EXCLUDE
	subconfig.vm.network "private_network", ip: "10.10.20.15", virtualbox__intnet: true
	subconfig.vm.hostname = "mmdb.cpt.local"
	subconfig.vm.provider "virtualbox" do |vb|
		vb.name = "MMDb"
		vb.memory = "2048"
		vb.cpus = 1
		vb.customize ["modifyvm", :id, "--uart1", "0x3F8", "4"]
		vb.customize ["modifyvm", :id, "--uartmode1", "file", File::NULL]
	end
	subconfig.vm.box_check_update = BOX_CHK_UPDATE
	subconfig.ssh.insert_key = SSH_INSERT_KEY
	if Vagrant.has_plugin?("vagrant-vbguest")
		subconfig.vbguest.auto_update = VB_CHK_UPDATE
	end
	#provisioning
	subconfig.vm.provision "shell", path: "./scripts/provision_update.sh"
	subconfig.vm.provision "shell", path: "./scripts/provision_mysql.sh"
  end
  
end
#vagrant reload
