#
# Cookbook Name:: crawler
# Recipe:: default
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

%w{git libmemcached-dev libmysqlclient-dev libshadow-ruby1.8}.each do |pkg|
    package pkg
end

include_recipe "crawler::user"

directory "#{node[:crawler][:repo_path]}" do
  owner "#{node[:crawler][:user]}"
end

git "#{node[:crawler][:path]}" do
  repository "git://github.com/rafaduran/rdc_crawler.git"
  reference "HEAD"
  user "#{node[:crawler][:user]}"
  group "#{node[:crawler][:group]}"
  action :sync
end

include_recipe "crawler::pips"

template "#{node[:crawler][:path]}/rdc_crawler/local/local_settings.py" do
  source "local_settings.py.erb"
  owner "#{node[:crawler][:user]}"
  group "#{node[:crawler][:group]}"
end

template "#{node[:crawler][:venv_path]}/lib/python2.7/site-packages/rdc_crawler.pth" do
  source "rdc_crawler.pth.erb"
  owner "#{node[:crawler][:user]}"
  group "#{node[:crawler][:group]}"
end

# Creating Django database
gem_package "mysql" do
  action :install
end

mysql_database "create #{node[:crawler][:dj_db_name]} database" do
  host "#{node[:crawler][:dj_db_host]}"
  username "#{node[:crawler][:dj_db_user]}"
  password "#{node[:crawler][:dj_db_pass]}"
  database "#{node[:crawler][:dj_db_name]}"
  action [:create_db]
end

execute "#{node[:crawler][:path]}/tools/with_venv.sh python #{node[:crawler][:repo_path]}/rdc-web-crawler/rdc_crawler/manage.py syncdb --noinput" do
  action :run
  user "#{node[:crawler][:user]}"
end

execute "#{node[:crawler][:path]}/tools/with_venv.sh python #{node[:crawler][:repo_path]}/rdc-web-crawler/rdc_crawler/manage.py update_couch_views" do
  action :run
  user "#{node[:crawler][:user]}"
end

