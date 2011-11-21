current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]
ookbook_copyright "Rafael Durán Castañeda"
cookbook_license "apachev2"
cookbook_email "rafadurancastaneda@gmail.com"
maintainer "RDC"
