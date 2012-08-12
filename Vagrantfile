# -*- mode: ruby -*-
# vi: set ft=ruby :

COOKBOOKS_PATH = ENV['VAGRANT_COOKBOOKS_PATH'] || ['cookbooks', 'site-cookbooks']
ROLES_PATH     = ENV['VAGRANT_ROLES_PATH'] || 'roles'
DATABAGS_PATH  = ENV['VAGRANT_DATABAGS_PATH'] || 'data_bags'
BOXES = {
  :ubuntu => {
    :name => 'precise64',
    :url  => 'http://files.vagrantup.com/precise64.box',
  },
  :debian => {
    :name => 'squeeze64',
    :url  => 'http://dl.dropbox.com/u/937870/VMs/squeeze64.box',
  },
}

Vagrant::Config.run do |config|

  config.vm.define :ubumongo do |ubuntu_mongodb|
    # BOX settings
    ubuntu_mongodb.vm.box     = BOXES[:ubuntu][:name]
    ubuntu_mongodb.vm.box_url = BOXES[:ubuntu][:url]

    # Boot with a GUI so you can see the screen. (Default is headless)
    # config.vm.boot_mode = :gui

    # Networking settings
    ubuntu_mongodb.vm.network :hostonly, "192.168.33.10"
    # Forwrdring MongoDB port
    ubuntu_mongodb.vm.forward_port 27017, 27017

    ubuntu_mongodb.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = COOKBOOKS_PATH
      chef.roles_path = ROLES_PATH
      chef.data_bags_path = DATABAGS_PATH
      chef.add_role "mongodb-default"
    end
  end

  config.vm.define :debmongo do |debian_mongodb|
    # BOX settings
    debian_mongodb.vm.box     = BOXES[:debian][:name]
    debian_mongodb.vm.box_url = BOXES[:debian][:url]

    # Boot with a GUI so you can see the screen. (Default is headless)
    # config.vm.boot_mode = :gui

    # Networking settings
    debian_mongodb.vm.network :hostonly, "192.168.33.11"
    # Forwrdring MongoDB port
    debian_mongodb.vm.forward_port 27017, 27017

    debian_mongodb.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = COOKBOOKS_PATH
      chef.roles_path = ROLES_PATH
      chef.data_bags_path = DATABAGS_PATH
      chef.add_role "mongodb"
    end
  end

end
