Vagrant.configure("2") do |config|

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  end

  config.vm.define "cust1-core" do |server|
    server.vm.box = "generic/ubuntu2004"
    server.vm.hostname = "cust1-core"

    # Copy bird config config
    server.vm.provision "file", source: "cust1-core.bird.conf", destination: "/tmp/bird.conf"
    # Copy bashrd aliases
    server.vm.provision "file", source: "bashrc", destination: "/tmp/bashrc"

    # cust1-core1<->cust1-ce1
    server.vm.network "private_network", ip: "192.168.12.12", netmask: "255.255.255.0"
    # cust1-core1<->cust1-ce2
    server.vm.network "private_network", ip: "192.168.13.12", netmask: "255.255.255.0"
    # for inside world
    server.vm.network "private_network", ip: "192.168.11.11", netmask: "255.255.255.0"

    # do basic setup
    server.vm.provision "shell", privileged: true, path: "basic-setup.sh"

  end

  config.vm.define "cust1-ce1" do |server|
    server.vm.box = "generic/ubuntu2004"
    server.vm.hostname = "cust1-ce1"

    # Copy bird config config
    server.vm.provision "file", source: "cust1-ce1.bird.conf", destination: "/tmp/bird.conf"
    # Copy bashrd aliases
    server.vm.provision "file", source: "bashrc", destination: "/tmp/bashrc"

    # cust1-ce1<->cust1-core1
    server.vm.network "private_network", ip: "192.168.12.11", netmask: "255.255.255.0"
    # cust1-ce1<->cust1-ce2
    server.vm.network "private_network", ip: "192.168.14.11", netmask: "255.255.255.0"
    # cust1-ce1<->sp1-p1
    server.vm.network "private_network", ip: "10.10.1.12", netmask: "255.255.255.0"

    # do basic setup
    server.vm.provision "shell", privileged: true, path: "basic-setup.sh"

  end

  config.vm.define "cust1-ce2" do |server|
    server.vm.box = "generic/ubuntu2004"
    server.vm.hostname = "cust1-ce2"

    # Copy bird config config
    server.vm.provision "file", source: "cust1-ce2.bird.conf", destination: "/tmp/bird.conf"
    # Copy bashrd aliases
    server.vm.provision "file", source: "bashrc", destination: "/tmp/bashrc"

    # cust1-ce2<->cust1-core1
    server.vm.network "private_network", ip: "192.168.13.11", netmask: "255.255.255.0"
    # cust1-ce1<->cust1-ce2
    server.vm.network "private_network", ip: "192.168.14.12", netmask: "255.255.255.0"
    # cust1-ce2<->sp2-p1
    server.vm.network "private_network", ip: "10.11.1.12", netmask: "255.255.255.0"

    # do basic setup
    server.vm.provision "shell", privileged: true, path: "basic-setup.sh"

  end

  config.vm.define "sp1-p1" do |server|
    server.vm.box = "generic/ubuntu2004"
    server.vm.hostname = "sp1-p1"

    # Copy bird config config
    server.vm.provision "file", source: "sp1-p1.bird.conf", destination: "/tmp/bird.conf"
    # Copy bashrd aliases
    server.vm.provision "file", source: "bashrc", destination: "/tmp/bashrc"

    # sp1-p1<->cust1-ce1
    server.vm.network "private_network", ip: "10.10.1.11", netmask: "255.255.255.0"
    # sp1-p1<->cloud1-ce1
    server.vm.network "private_network", ip: "10.10.2.11", netmask: "255.255.255.0"

    # do basic setup
    server.vm.provision "shell", privileged: true, path: "basic-setup.sh"

  end

  config.vm.define "sp2-p1" do |server|
    server.vm.box = "generic/ubuntu2004"
    server.vm.hostname = "sp2-p1"

    # Copy bird config config
    server.vm.provision "file", source: "sp2-p1.bird.conf", destination: "/tmp/bird.conf"
    # Copy bashrd aliases
    server.vm.provision "file", source: "bashrc", destination: "/tmp/bashrc"

    # sp2-p1<->cust1-ce2
    server.vm.network "private_network", ip: "10.11.1.11", netmask: "255.255.255.0"
    # sp2-p1<->cloud1-ce1
    server.vm.network "private_network", ip: "10.11.2.11", netmask: "255.255.255.0"

    # do basic setup
    server.vm.provision "shell", privileged: true, path: "basic-setup.sh"

  end

  config.vm.define "cloud1-ce1" do |server|
    server.vm.box = "generic/ubuntu2004"
    server.vm.hostname = "cloud1-ce1"

    # Copy bird config config
    server.vm.provision "file", source: "cloud1-ce1.bird.conf", destination: "/tmp/bird.conf"
    # Copy bashrd aliases
    server.vm.provision "file", source: "bashrc", destination: "/tmp/bashrc"

    # sp1-p1<->cloud1-ce1
    server.vm.network "private_network", ip: "10.10.2.12", netmask: "255.255.255.0"
    # sp2-p1<->cloud1-ce1
    server.vm.network "private_network", ip: "10.11.2.12", netmask: "255.255.255.0"
    # for inside world
    server.vm.network "private_network", ip: "172.16.100.11", netmask: "255.255.255.0"

    # do basic setup
    server.vm.provision "shell", privileged: true, path: "basic-setup.sh"

  end


end
