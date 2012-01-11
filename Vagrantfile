require "json"

current_dir = File.dirname(__FILE__)
node_json = JSON.parse(File.read("#{current_dir}/node.json"))

Vagrant::Config.run do |config|
    config.vm.define :couchdb do |couch_config|
        couch_config.vm.box = "oneiric"
        couch_config.vm.host_name = "couchdb1.example.com"
        couch_config.vm.network('192.168.100.10', :adapter => 1)
        #couch_config.vm.forward_port "nginx", 80, 8080
        couch_config.vm.customize do |vm|
            vm.memory_size = 613
        end

        couch_config.vm.provision :chef_solo do |chef|
            chef.cookbooks_path = "cookbooks"
            chef.roles_path = "roles"
            chef.node_name = "couchdb1"
            chef.run_list = node_json[chef.node_name]["run_list"]
 #           chef.json = node_json[chef.node_name]
        end
    end

    config.vm.define :common do |common_config|
        common_config.vm.box = "oneiric"
        common_config.vm.host_name = "common1.example.com"
        common_config.vm.network('192.168.100.20', :adapter => 1)
        #common_config.vm.forward_port "mysql", 3306, 3306
        #common_config.vm.forward_port "memcached", 11211, 11211
        common_config.vm.customize do |vm|
            vm.memory_size = 613
        end

        common_config.vm.provision :chef_solo do |chef|
            chef.cookbooks_path = "cookbooks"
            chef.roles_path = "roles"
            chef.node_name = "common1"
            chef.run_list = node_json[chef.node_name]["run_list"]
            # You may also specify custom JSON attributes:
#            chef.json = node_json[chef.node_name]
        end
    end

    config.vm.define :worker1 do |worker_config|
        worker_config.vm.box = "oneiric"
        worker_config.vm.host_name = "worker1.example.com"
        worker_config.vm.network('192.168.100.30', :adapter => 1)
        worker_config.vm.customize do |vm|
            vm.memory_size = 613
        end

        worker_config.vm.provision :chef_solo do |chef|
            chef.cookbooks_path = "cookbooks"
            chef.roles_path = "roles"
            chef.node_name = "worker1"
            chef.run_list = node_json[chef.node_name]["run_list"]
            # You may also specify custom JSON attributes:
  #          chef.json = node_json[chef.node_name]
        end
    end

    config.vm.define :worker2 do |worker_config|
        worker_config.vm.box = "oneiric"
        worker_config.vm.host_name = "worker2.example.com"
        worker_config.vm.network('192.168.100.40', :adapter => 1)
        worker_config.vm.customize do |vm|
            vm.memory_size = 613
        end

        worker_config.vm.provision :chef_solo do |chef|
            chef.cookbooks_path = "cookbooks"
            chef.roles_path = "roles"
            chef.node_name = "worker2"
            chef.run_list = node_json[chef.node_name]["run_list"]
            # You may also specify custom JSON attributes:
#            chef.json = node_json[chef.node_name]
        end
    end

    config.vm.define :worker3 do |worker_config|
        worker_config.vm.box = "oneiric"
        worker_config.vm.host_name = "worker3.example.com"
        worker_config.vm.network('192.168.100.50', :adapter => 1)
        worker_config.vm.customize do |vm|
            vm.memory_size = 613
        end

        worker_config.vm.provision :chef_solo do |chef|
            chef.cookbooks_path = "cookbooks"
            chef.roles_path = "roles"
            chef.node_name = "worker3"
            chef.run_list = node_json[chef.node_name]["run_list"]
            # You may also specify custom JSON attributes:
 #           chef.json = node_json[chef.node_name]
        end
    end

    config.vm.define :webind do |webind_config|
        webind_config.vm.box = "oneiric"
        webind_config.vm.host_name = "webind.example.com"
        webind_config.vm.network('192.168.100.60', :adapter => 1)
        webind_config.vm.customize do |vm|
            vm.memory_size = 613
        end

        webind_config.vm.provision :chef_solo do |chef|
            chef.cookbooks_path = "cookbooks"
            chef.roles_path = "roles"
            chef.node_name = "webind"
            chef.run_list = node_json[chef.node_name]["run_list"]
            # You may also specify custom JSON attributes:
 #           chef.json = node_json[chef.node_name]
        end
    end

end
