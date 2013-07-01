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
            chef.roles_path = "roles"
            chef.add_role("all_in_one")
            chef.json = {
                :couchdb_username => "foobaz",
                :couchdb_plaintext_password => "foobaz",
            }
        end

    end

end
