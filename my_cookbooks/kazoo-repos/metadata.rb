name             'kazoo-repos'
maintainer       'Noah Mehl'
maintainer_email 'noah@tritonlimited.com'
license          'Apache 2.0'
description      'Installs/Configures kazoo-repos'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'
recipe            "kazoo-repos", "Does nothing"
recipe            "kazoo-repos::erlang-solutions", "Installs the erlang-solutions repo"
recipe            "kazoo-repos::cloudant", "Installs the cloudant repo"

%w{redhat centos scientific oracle}.each do |el|
  supports el, ">= 6.0"
end

depends "yum"