name             'kazoo-hostsfile'
maintainer       'Noah Mehl'
maintainer_email 'noah@tritonlimited.com'
license          'Apache 2.0'
description      'Installs/Configures kazoo-hostsfile'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'
recipe            "kazoo-hostsfile", "Adds hosts entries for kazoo machines"

%w{redhat centos scientific oracle}.each do |el|
  supports el, ">= 6.0"
end

depends "hostsfile"