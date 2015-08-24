# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

module OS
    def OS.windows?
        (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
    end

    def OS.mac?
        (/darwin/ =~ RUBY_PLATFORM) != nil
    end

    def OS.unix?
        !OS.windows?
    end

    def OS.linux?
        OS.unix? and not OS.mac?
    end
end

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.define "node2" do |node|
        node.vm.box = "trusty64"
        node.vm.network "private_network", ip: "10.10.103.223"
        node.vm.host_name = "Minion-1"
        if OS.windows?
            puts "Vagrant launched from windows."
            p = File.expand_path("../", __FILE__)
            node.vm.provision "shell" do |s|
                s.path = p + "\\install-docker-bridge.sh"
            end
        elsif OS.mac?
            puts "Vagrant launched from mac."
            node.vm.provision "shell", path: "install-docker-bridge.sh"
        end
    end

    config.vm.define "node2" do |node|
        node.vm.box = "trusty64"
        node.vm.network "private_network", ip: "10.10.103.162"
        node.vm.host_name = "Minion-2"
        if OS.windows?
            puts "Vagrant launched from windows."
            p = File.expand_path("../", __FILE__)
            node.vm.provision "shell" do |s|
                s.path = p + "\\install-docker-bridge.sh"
            end
        elsif OS.mac?
            puts "Vagrant launched from mac."
            node.vm.provision "shell", path: "install-docker-bridge.sh"
        end
    end

    config.vm.define "node1" do |node|
        node.vm.box = "trusty64"
        node.vm.network "private_network", ip: "10.10.103.250"
        node.vm.host_name = "Master"
        if OS.windows?
            puts "Vagrant launched from windows."
            p = File.expand_path("../", __FILE__)
            node.vm.provision "shell" do |s|
                s.path = p + "\\install-docker-bridge.sh"
            end
            node.vm.provision "shell" do |s|
                s.path = p + "\\setup-ssh.sh"
            end
            node.vm.provision "shell" do |s|
                s.path = p + "\\k8-install-configure.sh"
            end
        elsif OS.mac?
            puts "Vagrant launched from mac."
            node.vm.provision "shell", path: "install-docker-bridge.sh"
            node.vm.provision "shell", path: "setup-ssh.sh"
            node.vm.provision "shell", path: "k8-install-configure.sh"
        end
    end
end
