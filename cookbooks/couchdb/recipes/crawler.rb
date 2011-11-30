#
# Cookbook Name:: couchdb
# Recipe:: crawler
# Author:: Rafael Durán Castañeda <rafadurancastaneda@gmail.com>
#
# Copyright 2011, Rafael Durán Castañeda
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "couchdb"

package "curl" do
    action :install
end

# Adding admin user
execute "curl -X PUT http://localhost:5984/_config/admins/#{node[:couchdb][:admin_name]} -d '\"#{node[:couchdb][:admin_password]}\"'" do
    action :run
end

# Only valid user are allowed
execute "curl -X PUT http://#{node[:couchdb][:admin_name]}:#{node[:couchdb][:admin_password]}@localhost:5984/_config/couch_httpd_auth/require_valid_user -d '\"true\"'" do
    action :run
end
