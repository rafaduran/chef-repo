#
# Cookbook Name:: couchdb
# Recipe:: crawler
# Author:: Rafael Durán Castañeda <rafadurancastaneda@gmail.com>
#
# Copyright 2011, rdc
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

# Default values for admin_name and admin_password
default['couchdb']['admin_name'] = "admin"
default['couchdb']['admin_password'] = "secrete"