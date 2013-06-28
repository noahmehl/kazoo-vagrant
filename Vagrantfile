# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|

    config.vm.define :alice do |bigcouch|
        bigcouch.vm.box = "cent64-64bit-omnibus"
        bigcouch.box_url = "https://doc-0o-bs-docs.googleusercontent.com/docs/securesc/ha0ro937gcuc7l7deffksulhg5h7mbp1/4sm4lem7rlni5sihjm1klpd6chs8ebv3/1372370400000/00561044646504573797/*/0B-ZhGN1xRIX0ZDJpbzdxS3Z3bzA?h=16653014193614665626&e=downloada"
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
