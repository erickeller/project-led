# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.
  
  config.vm.define "etcdsvr" do |etcdsvr|
#  etcdsvr.vm.network "private_network", ip: "192.168.1.8"
  etcdsvr.vm.box = "fgrehm/trusty64-lxc"
  etcdsvr.vm.provision :shell, path: "provision.sh"
  etcdsvr.vm.provision :shell, path: "etcdsvr.sh"
  etcdsvr.vm.provider :lxc do |lxc|
    lxc.container_name = "etcdsvr"
    lxc.customize "network.type", "veth"
    lxc.customize "network.link", "lxcbr0"
    lxc.customize "network.ipv4", "10.0.3.7/24"
  end
  end
  config.vm.define "master" do |master|
#  master.vm.network "private_network", ip: "192.168.1.8"
  master.vm.box = "fgrehm/trusty64-lxc"
  master.vm.provision :shell, path: "provision.sh"
  master.vm.provider :lxc do |lxc|
    lxc.container_name = "master"
    lxc.customize "network.type", "veth"
    lxc.customize "network.link", "lxcbr0"
    lxc.customize "network.ipv4", "10.0.3.8/24"
  end
  #master.vm.provision "ansible" do |ansible|
    # ansible.sudo = true
    #ansible.playbook = "ansible/master.yml"
    # ansible.verbose = 'vvv'
  #end
  end
  config.vm.define "minion" do |minion|
#  minion.vm.network "private_network", ip: "192.168.1.9"
#  minion.vm.box = "fgrehm/wheezy64-lxc"
  minion.vm.box = "fgrehm/trusty64-lxc"
  minion.vm.provision :shell, path: "provision.sh"
  minion.vm.provider :lxc do |lxc|
    lxc.container_name = "minion"
    lxc.customize "network.type", "veth"
    lxc.customize "network.link", "lxcbr0"
    lxc.customize "network.ipv4", "10.0.3.9/24"
  end
  #minion.vm.provision "ansible" do |ansible|
    # ansible.sudo = true
    #ansible.playbook = "ansible/minion.yml"
    # ansible.verbose = 'vvv'
  #end
  end
end
