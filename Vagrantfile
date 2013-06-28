# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|

    config.vm.define :alice do |bigcouch|
        bigcouch.vm.box = "cent64-64bit-omnibus"
        bigcouch.box_url = "https://googledrive.com/host/0B-ZhGN1xRIX0VWJwbjVWWDU2OTQ/cent64-64bit-omnibus.box"
        bigcouch.vm.host_name = "alice.domain.com"
        bigcouch.vm.network :hostonly, "192.168.122.111"
        bigcouch.vm.forward_port 22, 22111

        bigcouch.vm.provision :chef_solo do |chef|
            chef.cookbooks_path = ["cookbooks", "my_cookbooks"]
            chef.add_recipe "yum::yum"
            chef.add_recipe "yum::epel"
            chef.add_recipe "kazoo-repos::cloudant"
            chef.add_recipe "kazoo-repos::erlang-solutions"
            chef.add_recipe "kazoo-erlang"
            chef.add_recipe "kazoo-bigcouch"
            chef.json {
            }
        end

    end

end
