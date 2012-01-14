#
# Cookbook Name:: crawler
# Recipe:: web
#
# Copyright 2011, Rafael Durán Castañeda
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
# This recipe include web node configuration

include_recipe "crawler::default"

node.set_unless['gunicorn']['log_dir'] = "/var/log/gunicorn"

package "libevent-dev" do
  action :install
end

python_pip "gunicorn" do
  virtualenv "#{node[:crawler][:repo_path]}/rdc-web-crawler/.crawler-venv"
  action :install
end

python_pip "gevent" do
  virtualenv "#{node[:crawler][:repo_path]}/rdc-web-crawler/.crawler-venv"
  action :install
end

template "/etc/init/gunicorn.conf" do
  source "etc/init/gunicorn.conf.erb"
  owner  "root"
  group  "root"
  mode   0750
end

directory "#{node[:gunicorn][:log_dir]}" do
  owner "#{node[:crawler][:user]}"
  group "#{node[:crawler][:user]}"
end

service "gunicorn" do
  provider Chef::Provider::Service::Upstart
  enabled true
  running true
  supports :restart => true, :reload => true, :status => true
  action [:enable, :start]
end
