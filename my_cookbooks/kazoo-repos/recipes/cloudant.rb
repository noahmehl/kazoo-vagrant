#
# Cookbook Name:: kazoo-repos
# Recipe:: kazoo-repos::cloudant
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

include_recipe "yum"

#yum_key node['yum']['cloudant']['key'] do
#  url  node['yum']['cloudant']['key_url']
#  action :add
#end

yum_repository "cloudant" do
  description "Cloudant Bigcouch Repo"
#  key node['yum']['cloudant']['key']
  url node['yum']['cloudant']['url']
  includepkgs node['yum']['cloudant']['includepkgs']
  exclude node['yum']['cloudant']['exclude']
  action :create
end