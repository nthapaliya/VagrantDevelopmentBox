# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  # https://docs.vagrantup.com.

  config.vm.box = "ubuntu/trusty64"
  config.vm.define "DevelopmentServer"

  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpus = 2
  end

  config.ssh.forward_agent = true

  # https://github.com/mitchellh/vagrant/issues/1673#issuecomment-28288042
  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

  config.vm.provision "Bootstrap: root", type: "shell" do |s|
    s.path = "bootstrap.sh"
  end

  config.vm.provision "Bootstrap: clone", type: "shell" do |s|
    s.privileged = false
    s.path = "clone.sh"
  end

  config.vm.provision "Bootstrap: install", type: "shell" do |s|
    s.privileged = false
    s.path = "install.sh"
  end

  # config.vm.provision "Post-install scripts", type: "file" do |s|
  #   s.source = "run-me.sh"
  #   s.destination = "~/run-me.sh"
  # end

  config.vm.post_up_message = "Have fun!"
end
