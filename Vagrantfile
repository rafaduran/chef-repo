Vagrant::Config.run do |config|
  config.vm.define :couchdb do |couch_config|
    couch_config.vm.box = "oneiric"
    couch_config.vm.host_name = "couchdb.example.com"
    couch_config.vm.network('33.33.33.10',    :adapter => 1)
    couch_config.vm.network('192.168.100.10', :adapter => 2)
    #couch_config.vm.forward_port "nginx", 80, 8080
    couch_config.vm.customize do |vm|
      vm.memory_size = 512
    end

    couch_config.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = "cookbooks"
      chef.add_recipe "nginx::couchdb-proxy"
      chef.add_recipe "couchdb::crawler"
      # You may also specify custom JSON attributes:
      chef.json = { 
        :couchdb => {
          :admin_name     => "admin",
          :admin_password => "pass"
        }
      }
    end
  end

  config.vm.define :common do |common_config|
    common_config.vm.box = "oneiric"
    common_config.vm.host_name = "common.example.com"
    common_config.vm.network('33.33.33.20',    :adapter => 1)
    common_config.vm.network('192.168.100.20', :adapter => 2)
    #common_config.vm.forward_port "mysql", 3306, 3306
    #common_config.vm.forward_port "memcached", 11211, 11211
    common_config.vm.customize do |vm|
      vm.memory_size = 512
    end

    common_config.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = "cookbooks"
      chef.add_recipe "mysql::server"
      chef.add_recipe "memcached"
      # You may also specify custom JSON attributes:
      chef.json = {
        :mysql => {
          :server_root_password => "pass",
          :allow_remote_root    => true,
          :bind_address         => "0.0.0.0"
        }
      }
    end
  end

  config.vm.define :web1 do |web_config|
    web_config.vm.box = "oneiric"
    web_config.vm.host_name = "web1.example.com"
    web_config.vm.network('33.33.33.30',    :adapter => 1)
    web_config.vm.network('192.168.100.30', :adapter => 2)
    web_config.vm.customize do |vm|
      vm.memory_size = 512
    end

    web_config.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = "cookbooks"
      chef.add_recipe "crawler"
      # You may also specify custom JSON attributes:
      chef.json = {}
    end
  end
end
