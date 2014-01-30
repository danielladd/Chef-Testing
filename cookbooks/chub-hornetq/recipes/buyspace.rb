#
# Cookbook Name:: chub-hornetq
# Recipe:: buyspace
#
# Copyright 2014, CommerceHub Inc.
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


# Ensure a /opt directory
# Ensure a /etc directory

# # if local file cache is not available, download from internet
# uri = URI(url)
# request = Net::HTTP.new uri.host
# response = request.request_head uri.path
# if response.code.to_i == 200
# 	# use local http
# else
# 	# use jboss.org site
# 	# throw a chef warning
# end

# remote_file hornetq-$version
# 	creates ...

# extract_archive
# 	creates ...
# 	notifies tomcat reload later

# link node['chub-hornetq']['app_dir'] to node['chub-hornetq']['app_dir']-#{node['chub-hornetq']['version']}

# download config archive
# 	creates ...

# extract config archive
# 	creates ...
# 	notifies tomcat reload
