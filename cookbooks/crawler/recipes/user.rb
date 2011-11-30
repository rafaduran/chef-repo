#
# Cookbook Name:: crawler
# Recipe:: user
#
# Copyright 2011, RDC
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

group "#{node[:crawler][:group]}" do
  action :create
end

user "#{node[:crawler][:user]}" do
  home "/home/#{node[:crawler][:user]}"
  gid "#{node[:crawler][:group]}"
  password "#{node[:crawler][:password].crypt(node[:crawler][:password])}"
end

directory "/home/#{node[:crawler][:user]}" do
  owner "#{node[:crawler][:user]}"
  group "#{node[:crawler][:user]}"
end

# Adding user to sudo group, so gaining sudoers powers
group "sudo" do
  action :modify
  members "#{node[:crawler][:user]}"
end
