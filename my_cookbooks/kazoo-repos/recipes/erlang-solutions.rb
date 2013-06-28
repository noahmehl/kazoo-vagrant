#
# Cookbook Name:: kazoo-repos
# Recipe:: kazoo-repos::erlan-solutions
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

yum_key node['yum']['erlang-solutions']['key'] do
  url  node['yum']['erlang-solutions']['key_url']
  action :add
end

yum_repository "erlang-solutions" do
  description "erlang-solutions Bigcouch Repo"
  key node['yum']['erlang-solutions']['key']
  url node['yum']['erlang-solutions']['url']
  includepkgs node['yum']['erlang-solutions']['includepkgs']
  exclude node['yum']['erlang-solutions']['exclude']
  action :create
end