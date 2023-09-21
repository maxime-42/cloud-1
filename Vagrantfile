SERVER_IP="192.168.56.10"

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/jammy64" 

  config.vm.provider "virtualbox" do |vb|
    vb.cpus = 2
    vb.memory = 2048
  end

  config.vm.network "private_network", ip: SERVER_IP
  config.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "/tmp/id_rsa.pub"

  config.vm.provision "shell", name: "Setting up cloud-1", privileged: true,  inline: <<-SHELL
    set -e
    apt update

    cat /tmp/id_rsa.pub >> ~/.ssh/authorized_keys
    rm /tmp/id_rsa.pub

  SHELL

end