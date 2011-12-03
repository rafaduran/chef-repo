# Attributes for crawler
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

# Generic settings
default[:crawler][:version] = "0.0"
default[:crawler][:repo_path] = "/opt"
default[:crawler][:develop] = true
default[:crawler][:user_agent] = "Rdc-Crawler/#{node.crawler.version}"
default[:crawler][:secret_key] = "999888777666"
default[:crawler][:user] = "crawler"
default[:crawler][:group] = "crawler"
default[:crawler][:password] = "pass"

# CouchDB settings
default[:crawler][:couch_host]  = "192.168.100.10"
default[:crawler][:couch_port]  = ""
default[:crawler][:couch_vhost] = "couchdb"
default[:crawler][:couch_user]  = "admin"
default[:crawler][:couch_pass]  = "pass"

# Cache settings
default[:crawler][:cache_backend] = "memcached.MemcachedCache"
default[:crawler][:cache_host]    = "192.168.100.20"
default[:crawler][:cache_port]    = "11211"

# Django DB settings
default[:crawler][:dj_db_engine] = "mysql"
default[:crawler][:dj_db_name]   = "couchdb"
default[:crawler][:dj_db_user]   = "root"
default[:crawler][:dj_db_pass]   = "pass"
default[:crawler][:dj_db_host]   = "192.168.100.20"
default[:crawler][:dj_db_port]   = "3306"

# Celery settings
default[:crawler][:broker_host]  = node.crawler.couch_host
default[:crawler][:broker_port]  = "80"
default[:crawler][:broker_user]  = node.crawler.couch_user
default[:crawler][:broker_pass]  = node.crawler.couch_pass
default[:crawler][:broker_vhost] = "#{node.crawler.couch_vhost}/celery"

# Whoosh settings
default[:crawler][:whoosh_path] = "#{node.crawler.repo_path}/rdc-web-crawler/whoosh"
default[:crawler][:whoosh_lock_attempts] = 5
