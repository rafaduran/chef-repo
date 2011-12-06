Vagrant::Config.run do |config|
  config.vm.define :couchdb do |couch_config|
    couch_config.vm.box = "oneiric"
    couch_config.vm.host_name = "couchdb.example.com"
    couch_config.vm.network('33.33.33.10',    :adapter => 1)
    couch_config.vm.network('192.168.100.10', :adapter => 2)
    #couch_config.vm.forward_port "nginx", 80, 8080
    couch_config.vm.customize do |vm|
      vm.memory_size = 613
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
        },
        :nginx => {
            :worker_processes => 4
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
      vm.memory_size = 613
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

  config.vm.define :worker1 do |worker_config|
    worker_config.vm.box = "oneiric"
    worker_config.vm.host_name = "worker1.example.com"
    worker_config.vm.network('33.33.33.30',    :adapter => 1)
    worker_config.vm.network('192.168.100.30', :adapter => 2)
    worker_config.vm.customize do |vm|
      vm.memory_size = 613
    end

    worker_config.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = "cookbooks"
      chef.add_recipe "crawler"
      chef.add_recipe "celery"
      # You may also specify custom JSON attributes:
      chef.json = {
        :celery => {
            :command    => "/opt/rdc-web-crawler/tools/with_venv.sh python /opt/rdc-web-crawler/rdc_crawler/manage.py celeryd",
            :user       => "crawler",
            :group      => "crawler",
            :virtualenv => "/opt/rdc-web-crawler/.crawler-venv",
            :beat       => false,
            :workers    => 2
        },
        :crawler => {
            :ssh_keys   => ["ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCsVQXqzLcLL/IWdsWkdveVBl1iKjwjHIFdSqTVEl5TkM1Xps/3MEo4eBrx24j7TG05D6brBudDe5vgmP02GaCPwq8PRZVt6dQc0BYVHWftRD3rA+rerrByzLt2s5nq6v0r2k67asxLTFVVGAlH7OtdK0QTufAA4jqZx71Zs/NAd4F7btuaZKumdKs1ZXrRaTh0G4bpRvipOl/r2b3/AgtHYpZgKvn6/22fBVXDlXnvK/jMTfuQhIXxoDepeTGd133xvZrNslqsZiVCy3qeTo7FdA4WBuoHjnZAu8+7GPeuMDzSHChwdF5hNEW8roJbGK3YX9Se/xA0Hoc4+NyCOOqv crawler insecure public key"]
        }
      }
    end
  end

  config.vm.define :worker2 do |worker_config|
    worker_config.vm.box = "oneiric"
    worker_config.vm.host_name = "worker2.example.com"
    worker_config.vm.network('33.33.33.30',    :adapter => 1)
    worker_config.vm.network('192.168.100.40', :adapter => 2)
    worker_config.vm.customize do |vm|
      vm.memory_size = 613
    end

    worker_config.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = "cookbooks"
      chef.add_recipe "crawler"
      chef.add_recipe "celery"
      # You may also specify custom JSON attributes:
      chef.json = {
        :celery => {
            :command    => "/opt/rdc-web-crawler/tools/with_venv.sh python /opt/rdc-web-crawler/rdc_crawler/manage.py celeryd",
            :user       => "crawler",
            :group      => "crawler",
            :virtualenv => "/opt/rdc-web-crawler/.crawler-venv",
            :beat       => false,
            :workers    => 2
        },
        :crawler => {
            :ssh_keys   => ["ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCsVQXqzLcLL/IWdsWkdveVBl1iKjwjHIFdSqTVEl5TkM1Xps/3MEo4eBrx24j7TG05D6brBudDe5vgmP02GaCPwq8PRZVt6dQc0BYVHWftRD3rA+rerrByzLt2s5nq6v0r2k67asxLTFVVGAlH7OtdK0QTufAA4jqZx71Zs/NAd4F7btuaZKumdKs1ZXrRaTh0G4bpRvipOl/r2b3/AgtHYpZgKvn6/22fBVXDlXnvK/jMTfuQhIXxoDepeTGd133xvZrNslqsZiVCy3qeTo7FdA4WBuoHjnZAu8+7GPeuMDzSHChwdF5hNEW8roJbGK3YX9Se/xA0Hoc4+NyCOOqv crawler insecure public key"]
        }
      }
    end
  end

  config.vm.define :worker3 do |worker_config|
    worker_config.vm.box = "oneiric"
    worker_config.vm.host_name = "worker3.example.com"
    worker_config.vm.network('33.33.33.30',    :adapter => 1)
    worker_config.vm.network('192.168.100.50', :adapter => 2)
    worker_config.vm.customize do |vm|
      vm.memory_size = 613
    end

    worker_config.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = "cookbooks"
      chef.add_recipe "crawler"
      chef.add_recipe "celery"
      # You may also specify custom JSON attributes:
      chef.json = {
        :celery => {
            :command    => "/opt/rdc-web-crawler/tools/with_venv.sh python /opt/rdc-web-crawler/rdc_crawler/manage.py celeryd",
            :user       => "crawler",
            :group      => "crawler",
            :virtualenv => "/opt/rdc-web-crawler/.crawler-venv",
            :beat       => false,
            :workers    => 2
        },
        :crawler => {
            :ssh_keys   => ["ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCsVQXqzLcLL/IWdsWkdveVBl1iKjwjHIFdSqTVEl5TkM1Xps/3MEo4eBrx24j7TG05D6brBudDe5vgmP02GaCPwq8PRZVt6dQc0BYVHWftRD3rA+rerrByzLt2s5nq6v0r2k67asxLTFVVGAlH7OtdK0QTufAA4jqZx71Zs/NAd4F7btuaZKumdKs1ZXrRaTh0G4bpRvipOl/r2b3/AgtHYpZgKvn6/22fBVXDlXnvK/jMTfuQhIXxoDepeTGd133xvZrNslqsZiVCy3qeTo7FdA4WBuoHjnZAu8+7GPeuMDzSHChwdF5hNEW8roJbGK3YX9Se/xA0Hoc4+NyCOOqv crawler insecure public key"]
        }
      }
    end
  end

end
