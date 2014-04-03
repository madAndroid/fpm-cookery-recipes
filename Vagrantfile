# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.
    #
  config.vm.synced_folder "./", "/vagrant"
#  config.vm.synced_folder "./", "/vagrant", :nfs => true

  config.vm.provider "virtualbox" do |v|
    v.customize ["modifyvm", :id, "--memory", "1024"]
    v.customize ["modifyvm", :id, "--cpus", "2"]
  end

  # Every Vagrant virtual environment requires a box to build off of.

  config.vm.define :centos6 do |node1|
    node1.vm.hostname = 'centos.internal'
    node1.vm.box      = 'centos-65-x64-virtualbox-nocm.box'
    node1.vm.box_url  = 'http://puppet-vagrant-boxes.puppetlabs.com/centos-65-x64-virtualbox-nocm.box'
    node1.vm.network :private_network, ip: "10.200.0.10"
    node1.vm.provision :shell, :inline =>
        '([ -f epel-release-6-8.noarch.rpm ] || wget http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm) && '+
        '([ `rpm -qa | grep epel-release-6-8` ] || sudo rpm -Uvh epel-release-6-8.noarch.rpm) && '+
        'sudo yum install -y libyaml libyaml-devel &&' +
        'sudo yum install -y rubygems ruby-devel && sudo yum groupinstall -y "Development Tools" && '+
        'sudo gem update && sudo gem update --system && sudo gem install bundler && '+
        'cd /vagrant && sudo bundle install'

  end

  config.vm.define :precise do |node3|
    node3.vm.hostname = "precise"
    node3.vm.box      = 'ubuntu-server-12042-x64-vbox4210-nocm.box'
    node3.vm.box_url  = 'http://puppet-vagrant-boxes.puppetlabs.com/ubuntu-server-12042-x64-vbox4210-nocm.box'
    node3.vm.network :private_network, ip: "10.200.0.11"
    node3.vm.provision :shell, :inline =>
        'sudo apt-get update && apt-get install -y ruby ruby-dev rubygems build-essential && '+
        'sudo gem update && sudo gem update --system && sudo gem install bundler'
  end

end
