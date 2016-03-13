# -*- mode: ruby -*-
# vi: set ft=ruby :
require 'yaml'
current_dir    = File.dirname(File.expand_path(__FILE__))
configs        = YAML.load_file("#{current_dir}/config.yaml")

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  config.vm.define "etcdserver" do |etcdserver|
  etcdserver.vm.hostname = "etcdserver"
  etcdserver.vm.provider "virtualbox" do |v, vb|
    vb.vm.box = "ubuntu/trusty64"
    vb.vm.network "private_network", ip: configs['configs']['virtualbox']['etcdserver_ip']
    vb.vm.provision "ansible" do |ansible|
      ansible.playbook = "./ansible/etcdserver.yaml"
      ansible.extra_vars = { etcdserver_ip: configs['configs']['virtualbox']['etcdserver_ip'] }
    end
  end
  etcdserver.vm.provider "lxc" do |v, override|
    override.vm.box = "fgrehm/trusty64-lxc"
    override.vm.provision "ansible" do |ansible|
      ansible.playbook = "./ansible/etcdserver.yaml"
      ansible.extra_vars = { etcdserver_ip: configs['configs']['lxc']['etcdserver_ip'] }
    end
    override.vm.provider :lxc do |lxc|
      lxc.container_name = "etcdserver"
      lxc.customize "network.type", "veth"
      lxc.customize "network.link", "lxcbr0"
      lxc.customize "network.ipv4", configs['configs']['lxc']['etcdserver_ip']
      lxc.customize "aa_profile", "unconfined"
      lxc.customize "aa_allow_incomplete", "1"
    end
  end
  end

  config.vm.define "master" do |master|
  master.vm.hostname = "master"
  master.vm.provider "virtualbox" do |v, vb|
  master.vm.provision :shell, path: "shell/provision.sh"
  master.vm.provision :shell, path: "shell/saltstack.sh"
    vb.vm.box = "ubuntu/trusty64"
    vb.vm.network "private_network", ip: configs['configs']['virtualbox']['master_ip']
    vb.vm.provision :shell, path: "shell/master.sh", args: [configs['configs']['virtualbox']['etcdserver_ip'], configs['configs']['virtualbox']['master_ip']]
  end
  master.vm.provider "lxc" do |v, override|
    override.vm.box = "fgrehm/trusty64-lxc"
    override.vm.provision :shell, path: "shell/master.sh", args: [configs['configs']['lxc']['etcdserver_ip'], configs['configs']['lxc']['master_ip']]
    override.vm.provider :lxc do |lxc|
      lxc.container_name = "master"
      lxc.customize "network.type", "veth"
      lxc.customize "network.link", "lxcbr0"
      lxc.customize "network.ipv4", configs['configs']['lxc']['master_ip']
      lxc.customize "aa_profile", "unconfined"
      lxc.customize "aa_allow_incomplete", "1"
    end
  end
  end

  config.vm.define "minion" do |minion|
  minion.vm.hostname = "minion"
  minion.vm.provision :shell, path: "shell/provision.sh"
  minion.vm.provision :shell, path: "shell/saltstack.sh"
  minion.vm.provider "virtualbox" do |v, vb|
    vb.vm.box = "ubuntu/trusty64"
    vb.vm.network "private_network", ip: configs['configs']['virtualbox']['minion_ip']
    vb.vm.provision :shell, path: "shell/minion.sh", args: configs['configs']['virtualbox']['etcdserver_ip']
  end
  minion.vm.provider "lxc" do |v, override|
    override.vm.box = "fgrehm/trusty64-lxc"
    override.vm.provision :shell, path: "shell/minion.sh", args: configs['configs']['virtualbox']['etcdserver_ip']
    override.vm.provider :lxc do |lxc|
      lxc.container_name = "minion"
      lxc.customize "network.type", "veth"
      lxc.customize "network.link", "lxcbr0"
      lxc.customize "network.ipv4", configs['configs']['lxc']['minion_ip']
      lxc.customize "aa_profile", "unconfined"
      lxc.customize "aa_allow_incomplete", "1"
    end
  end
  end

  config.vm.define "minion2" do |minion2|
  minion2.vm.hostname = "minion2"
  minion2.vm.provision :shell, path: "shell/provision.sh"
  minion2.vm.provision :shell, path: "shell/saltstack.sh"
  minion2.vm.provider "virtualbox" do |v, vb|
    vb.vm.box = "ubuntu/trusty64"
    vb.vm.network "private_network", ip: configs['configs']['virtualbox']['minion2_ip']
    vb.vm.provision :shell, path: "shell/minion.sh", args: configs['configs']['virtualbox']['etcdserver_ip']
  end
  minion2.vm.provider "lxc" do |v, override|
    override.vm.box = "fgrehm/trusty64-lxc"
    override.vm.provision :shell, path: "shell/minion.sh", args: configs['configs']['virtualbox']['etcdserver_ip']
    override.vm.provider :lxc do |lxc|
      lxc.container_name = "minion2"
      lxc.customize "network.type", "veth"
      lxc.customize "network.link", "lxcbr0"
      lxc.customize "network.ipv4", configs['configs']['lxc']['minion2_ip']
      lxc.customize "aa_profile", "unconfined"
      lxc.customize "aa_allow_incomplete", "1"
    end
  end
  end
end
