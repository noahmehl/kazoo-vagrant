This is a repository for building out kazoo virtual machines

#Vagrant

To use Vagrant in this repo, you have to do a few things:

##Installation:

1. Virtualbox
2. Vagrant
3. Rake
4. Berkshelf

##Prep:

There are two tasks to run to prepare the environment.  The first task (gen_keys) creates an ssh key to become the root ssh key on all of the machines.  It also adds that key to root's authorized_keys file on all of the machines.  The second task (install_cookbooks) fires off a berkshelf install to the cookbooks directory.  There is also a clean up task (clean) that deletes the ssh and cookbooks.

To run:

rake install_cookbooks
rake clean