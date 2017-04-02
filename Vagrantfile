Vagrant.configure(2) do |config|
    config.vm.box = "ubuntu/trusty64"
    # ubuntu/xenial64
    config.vm.synced_folder ".", "/vagrant"
    config.vm.provision :shell, path: "provision.sh"
    config.vm.network :forwarded_port, guest: 80, host: 8000
    config.vm.network :forwarded_port, guest: 3000, host: 3000
    config.vm.network :forwarded_port, guest: 27017, host: 27017

    config.vm.provider :virtualbox do |v|
      v.customize [
        "modifyvm", :id,
        "--cpus", 2
      ]

      v.customize [
        "modifyvm", :id,
        "--memory", 1024
      ]

      v.customize [
        "modifyvm", :id,
        "--name", "esimplevagrant"
      ]
    end
end
