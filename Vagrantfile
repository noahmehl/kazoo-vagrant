# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|

    bigcouch_nodes = {
        :bob     => '112',
        :charlie => '113' 
    }

    bigcouch_nodes.each_pair do |node, ip_suffix|
        config.vm.define node do |bigcouch|
            bigcouch.vm.customize ["modifyvm", :id, "--memory", 256]
            bigcouch.vm.box = "cent64-64bit-omnibus"
            bigcouch.box_url = "https://googledrive.com/host/0B-ZhGN1xRIX0VWJwbjVWWDU2OTQ/cent64-64bit-omnibus.box"
            bigcouch.vm.host_name = "#{node.to_s}.domain.com"
            bigcouch.vm.network :hostonly, "192.168.122.#{ip_suffix}"
            bigcouch.vm.forward_port 22, "22#{ip_suffix}".to_i

            bigcouch.vm.provision :chef_solo do |chef|
                chef.cookbooks_path = ["cookbooks", "my_cookbooks"]
                chef.data_bags_path = "data_bags"
                chef.roles_path = "roles"
                chef.add_role("bigcouch")
                chef.json = {
                    :erlang => {
                        :install_method => "esl"
                    },
                    :couchdb_username => "foobaz",
                    :couchdb_plaintext_password => "foobaz",
                    :erlang_cookie => "cookiemonster",
                }
            end
        end
    end

    bigcouch_cluster_node = {
        :alice     => '111' 
    }

    bigcouch_cluster_node.each_pair do |node, ip_suffix|
        config.vm.define node do |bigcouch_cluster|
            bigcouch_cluster.vm.customize ["modifyvm", :id, "--memory", 256]
            bigcouch_cluster.vm.box = "cent64-64bit-omnibus"
            bigcouch_cluster.box_url = "https://googledrive.com/host/0B-ZhGN1xRIX0VWJwbjVWWDU2OTQ/cent64-64bit-omnibus.box"
            bigcouch_cluster.vm.host_name = "#{node.to_s}.domain.com"
            bigcouch_cluster.vm.network :hostonly, "192.168.122.#{ip_suffix}"
            bigcouch_cluster.vm.forward_port 22, "22#{ip_suffix}".to_i

            bigcouch_cluster.vm.provision :chef_solo do |chef|
                chef.cookbooks_path = ["cookbooks", "my_cookbooks"]
                chef.data_bags_path = "data_bags"
                chef.roles_path = "roles"
                chef.add_role("bigcouch")
                chef.add_recipe "kazoo-bigcouch::cluster"
                chef.json = {
                    :erlang => {
                        :install_method => "esl"
                    },
                    :couchdb_username => "foobaz",
                    :couchdb_plaintext_password => "foobaz",
                    :erlang_cookie => "cookiemonster",
                }
            end
        end
    end

    whapps_nodes = {
        :daisy     => '114',
        :eric      => '115' 
    }

    whapps_nodes.each_pair do |node, ip_suffix|
        config.vm.define node do |whapps|
            whapps.vm.customize ["modifyvm", :id, "--memory", 256]
            whapps.vm.box = "cent64-64bit-omnibus"
            whapps.box_url = "https://googledrive.com/host/0B-ZhGN1xRIX0VWJwbjVWWDU2OTQ/cent64-64bit-omnibus.box"
            whapps.vm.host_name = "#{node.to_s}.domain.com"
            whapps.vm.network :hostonly, "192.168.122.#{ip_suffix}"
            whapps.vm.forward_port 22, "22#{ip_suffix}".to_i

            whapps.vm.provision :chef_solo do |chef|
                chef.cookbooks_path = ["cookbooks", "my_cookbooks"]
                chef.data_bags_path = "data_bags"
                chef.roles_path = "roles"
                chef.add_role("whapps")
                chef.json = {
                    :erlang => {
                        :install_method => "esl"
                    },
                    :rabbit_mq => {
                        :erlang_cookie => "cookiemonster"
                    }
                }
            end
        end
    end
end