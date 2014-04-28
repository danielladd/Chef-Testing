#
# Cookbook Name:: chub_nginx
# Recipe:: defaultsite
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

# # NOTE: Please do not use this recipe unless you know exactly why you want it.
# # You should copy the _sample_static_site or _sample_php_site to a new recipe 
# # and use that.

include_recipe 'chub_nginx'

directory node[:nginx][:default_root] do
    owner 'www-data'
    group 'www-data'
    mode 0755
    recursive true
end