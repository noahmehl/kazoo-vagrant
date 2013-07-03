#
# Cookbook Name:: kazoo-hostsfile
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

hostsfile_entry "127.0.0.1" do
    hostname "localhost localhost.localdomain localhost4 localhost4.localdomain4"
    :update
end

hostsfile_entry "192.168.122.111" do
    hostname "alice.domain.com"
    :create
end

hostsfile_entry "192.168.122.112" do
    hostname "bob.domain.com"
    :create
end

hostsfile_entry "192.168.122.113" do
    hostname "charlie.domain.com"
    :create
end

hostsfile_entry "192.168.122.114" do
    hostname "daisy.domain.com"
    :create
end

hostsfile_entry "192.168.122.115" do
    hostname "eric.domain.com"
    :create
end

