#
# Cookbook Name:: kazoo-repos
# Attributes:: kazoo-repos::erlang-solutions
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


default['yum']['erlang-solutions']['url'] = "http://binaries.erlang-solutions.com/rpm/centos/#{node['platform_version'].to_i}/#{node['kernel']['machine']}"
default['yum']['erlang-solutions']['key'] = "erlang_solutions.asc"

default['yum']['erlang-solutions']['key_url'] = "http://binaries.erlang-solutions.com/debian/#{node['yum']['erlang-solutions']['key']}"
default['yum']['erlang-solutions']['includepkgs'] = nil
default['yum']['erlang-solutions']['exclude'] = nil