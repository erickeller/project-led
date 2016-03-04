# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  config.vm.define "etcdserver" do |etcdserver|
  etcdserver.vm.hostname = "etcdserver"
  etcdserver.vm.provision :shell, path: "provision.sh"
  etcdserver.vm.provision :shell, path: "etcdserver.sh"
  etcdserver.vm.provider "virtualbox" do |v, vb|
    vb.vm.box = "ubuntu/trusty64"
    vb.vm.network "private_network", ip: "192.168.10.7"
  end
  etcdserver.vm.provider "lxc" do |v, override|
    override.vm.box = "fgrehm/trusty64-lxc"
    override.vm.provider :lxc do |lxc|
      lxc.container_name = "etcdserver"
      lxc.customize "network.type", "veth"
      lxc.customize "network.link", "lxcbr0"
      lxc.customize "network.ipv4", "10.0.3.7/24"
      lxc.customize "aa_profile", "unconfined"
      lxc.customize "aa_allow_incomplete", "1"
    end
  end
  end

  config.vm.define "master" do |master|
  master.vm.hostname = "master"
  master.vm.provision :shell, path: "provision.sh"
  master.vm.provision :shell, path: "saltstack.sh"
  master.vm.provision :shell, path: "master.sh"
  master.vm.provider "virtualbox" do |v, vb|
    vb.vm.box = "ubuntu/trusty64"
    vb.vm.network "private_network", ip: "192.168.10.8"
  end
  master.vm.provider "lxc" do |v, override|
    override.vm.box = "fgrehm/trusty64-lxc"
    override.vm.provider :lxc do |lxc|
      lxc.container_name = "master"
      lxc.customize "network.type", "veth"
      lxc.customize "network.link", "lxcbr0"
      lxc.customize "network.ipv4", "10.0.3.8/24"
      lxc.customize "aa_profile", "unconfined"
      lxc.customize "aa_allow_incomplete", "1"
    end
  end
  end
  config.vm.define "minion" do |minion|
  minion.vm.hostname = "minion"
  minion.vm.provision :shell, path: "provision.sh"
  minion.vm.provision :shell, path: "saltstack.sh"
  minion.vm.provision :shell, path: "minion.sh"
  minion.vm.provider "virtualbox" do |v, vb|
    vb.vm.box = "ubuntu/trusty64"
    vb.vm.network "private_network", ip: "192.168.10.9"
  end
  minion.vm.provider "lxc" do |v, override|
    override.vm.box = "fgrehm/trusty64-lxc"
    override.vm.provider :lxc do |lxc|
      lxc.container_name = "minion"
      lxc.customize "network.type", "veth"
      lxc.customize "network.link", "lxcbr0"
      lxc.customize "network.ipv4", "10.0.3.9/24"
      lxc.customize "aa_profile", "unconfined"
      lxc.customize "aa_allow_incomplete", "1"
    end
  end
  end
  config.vm.define "minion2" do |minion2|
  minion2.vm.hostname = "minion2"
  minion2.vm.provision :shell, path: "provision.sh"
  minion2.vm.provision :shell, path: "saltstack.sh"
  minion2.vm.provision :shell, path: "minion.sh"
  minion2.vm.provider "virtualbox" do |v, vb|
    vb.vm.box = "ubuntu/trusty64"
    vb.vm.network "private_network", ip: "192.168.10.10"
  end
  minion2.vm.provider "lxc" do |v, override|
    override.vm.box = "fgrehm/trusty64-lxc"
    override.vm.provider :lxc do |lxc|
      lxc.container_name = "minion2"
      lxc.customize "network.type", "veth"
      lxc.customize "network.link", "lxcbr0"
      lxc.customize "network.ipv4", "10.0.3.10/24"
      lxc.customize "aa_profile", "unconfined"
      lxc.customize "aa_allow_incomplete", "1"
    end
  end
  end
end
