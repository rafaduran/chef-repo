#
# Cookbook Name:: crawler
# Recipe:: pips
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
# This recipe manage all needed pips

include_recipe "python"

python_virtualenv "#{node[:crawler][:repo_path]}/rdc-web-crawler/.crawler-venv" do
  owner "#{node[:crawler][:user]}"
  group "#{node[:crawler][:group]}"
  interpreter "python2.7"
  action :create
end


python_pip "CouchDB" do
  virtualenv "#{node[:crawler][:repo_path]}/rdc-web-crawler/.crawler-venv"
  action :install
end

python_pip "Celery" do
  virtualenv "#{node[:crawler][:repo_path]}/rdc-web-crawler/.crawler-venv"
  action :install
end

python_pip "django" do
  virtualenv "#{node[:crawler][:repo_path]}/rdc-web-crawler/.crawler-venv"
  action :install
end

python_pip "django-celery" do
  virtualenv "#{node[:crawler][:repo_path]}/rdc-web-crawler/.crawler-venv"
  action :install
end

python_pip "celerymon" do
  virtualenv "#{node[:crawler][:repo_path]}/rdc-web-crawler/.crawler-venv"
  action :install
end

python_pip "python-memcached" do
  virtualenv "#{node[:crawler][:repo_path]}/rdc-web-crawler/.crawler-venv"
  action :install
end

python_pip "pylibmc" do
  virtualenv "#{node[:crawler][:repo_path]}/rdc-web-crawler/.crawler-venv"
  action :install
end

python_pip "MySQL-python" do
  virtualenv "#{node[:crawler][:repo_path]}/rdc-web-crawler/.crawler-venv"
  action :install
end

python_pip "Whoosh" do
  virtualenv "#{node[:crawler][:repo_path]}/rdc-web-crawler/.crawler-venv"
  action :install
end

python_pip "BeautifulSoup" do
  virtualenv "#{node[:crawler][:repo_path]}/rdc-web-crawler/.crawler-venv"
  action :install
end

python_pip "-e git://github.com/rafaduran/kombu.git#egg=Kombu" do
  virtualenv "#{node[:crawler][:repo_path]}/rdc-web-crawler/.crawler-venv"
  action :install
end

if node[:crawler][:develop] 
  python_pip "pylint" do
    virtualenv "#{node[:crawler][:repo_path]}/rdc-web-crawler/.crawler-venv"
    action :install
  end

  python_pip "pep8" do
    virtualenv "#{node[:crawler][:repo_path]}/rdc-web-crawler/.crawler-venv"
    action :install
  end

  python_pip "pysqlite" do
    virtualenv "#{node[:crawler][:repo_path]}/rdc-web-crawler/.crawler-venv"
    action :install
  end

  python_pip "Fabric" do
    virtualenv "#{node[:crawler][:repo_path]}/rdc-web-crawler/.crawler-venv"
    action :install
  end

  python_pip "Jinja2" do
    virtualenv "#{node[:crawler][:repo_path]}/rdc-web-crawler/.crawler-venv"
    action :install
  end
end
