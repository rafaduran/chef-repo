# Attributes for nginx::couchdb-proxy
#
# Inherits nginx attributes but it uses it's own template
node.run_list.recipes.each do |role|
  if role == "nginx::couchdb-proxy"
    node[:nginx][:template] = "couchdb-proxy/default-site.erb"
  end
end