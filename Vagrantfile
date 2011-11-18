Vagrant::Config.run do |config|
    config.vm.define :couchdb do |couch_config|
      couch_config.vm.box = "oneiric"
      couch_config.vm.host_name = "couchdb.rdc.com"
      couch_config.vm.network('33.33.33.10',    :adapter => 1)
      couch_config.vm.network('192.168.100.10', :adapter => 2)
      couch_config.vm.forward_port "nginx", 80, 8080
      couch_config.vm.customize do |vm|
          vm.memory_size = 256
      end

        couch_config.vm.provision :chef_solo do |chef|
            chef.cookbooks_path = "cookbooks"
            chef.add_recipe "nginx::couchdb-proxy"
            chef.add_recipe "couchdb::crawler"
            # You may also specify custom JSON attributes:
            chef.json = { 
                :nginx => { 
                    :worker_processes => 2
                },
                :couchdb => {
                    :require_valid_user => true,
                    :root_password => "pass"
                }
            }
        end
     end
end
