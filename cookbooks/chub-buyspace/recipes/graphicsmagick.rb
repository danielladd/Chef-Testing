#
# Cookbook Name:: chub-buyspace
# Recipe:: graphicsmagick
#
# Copyright 2013, CommerceHub Inc.
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

# Installs our custom-compiled GraphicsMagick package.
# GraphicsMagick is a dependency of BuySpace

%w{
	libpng++-dev
	libjpeg-dev
	libtiff4-dev
}.each do |pkg|
	package pkg do
		action :install
	end
end


remote_file "/var/cache/apt/archives/graphicsmagick-1.3.18_amd64.deb" do
	source "http://dev4:8000/packages/graphicsmagick-1.3.18_amd64.deb"
	mode 0644
end

dpkg_package "graphicsmagick" do
	source "/var/cache/apt/archives/graphicsmagick-1.3.18_amd64.deb"
	action :install
end