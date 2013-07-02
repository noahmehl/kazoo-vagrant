#
# Cookbook Name:: kazoo-bigcouch
# Recipe:: cluster
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

bigcouch_servers = data_bag_item('kazoo', 'bigcouch')

bigcouch_servers['servers'].each do |fqdn, ipaddress|
  http_request "adding #{fqdn} to cluster" do
    action :put
    url "http://0.0.0.0:5986/nodes/bigcouch@#{fqdn}"
    message :data => ""
    ignore_failure true
  end
end