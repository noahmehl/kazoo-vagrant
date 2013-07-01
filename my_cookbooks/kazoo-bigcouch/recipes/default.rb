#
# Cookbook Name:: kazoo-bigcouch
# Recipe:: default
#
# Copyright 2013, Noah Mehl
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

package "bigcouch" do
  case node[:platform]
  when "redhat","centos","scientific","fedora","suse","amazon"
    package_name "bigcouch"
  end
  action :install
end

template "/etc/init.d/bigcouch" do
    source "bigcouch-init.d.erb"
    mode "0755"
end

service "bigcouch" do
  supports :start => true, :restart => true, :stop => true, :status => true
  start_command "/etc/init.d/bigcouch start"
  stop_command "/etc/init.d/bigcouch stop"
  restart_command "/etc/init.d/bigcouch restart"
  status_command "/etc/init.d/bigcouch status"
  action [ :enable, :start ]
end

directory node[:bigcouch][:database_dir] do
  owner "bigcouch"
  group "bigcouch"
  mode "0755"
end
 
directory node[:bigcouch][:view_index_dir] do
  owner "bigcouch"
  group "bigcouch"
  mode "0755"
end

directory node[:bigcouch][:log_dir] do
  owner "bigcouch"
  group "bigcouch"
  mode "0755"
end
 
template "/opt/bigcouch/etc/local.ini" do
  source "local_ini.erb"
  owner "bigcouch"
  group "bigcouch"
  mode 0644
  notifies :restart, resources(:service => "bigcouch"), :immediately
end

template "/etc/security/limits.d/bigcouch.limits.conf" do
  source "bigcouch.limits.conf.erb"
  owner "root"
  group "root"
  mode 0644
  notifies :restart, resources(:service => "bigcouch")
end

template "/home/bigcouch/.erlang.cookie" do
  source "erlang_cookie.erb"
  mode 0400
  owner "bigcouch"
  group "bigcouch"
end

template "/opt/bigcouch/etc/vm.args" do
  source "vm_args.erb"
  owner "bigcouch"
  group "bigcouch"
  mode 0644
  notifies :restart, resources(:service => "bigcouch")
end