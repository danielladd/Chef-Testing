#
# Cookbook Name:: chub_hubot
# Recipe:: hipchat
#
# Copyright (C) 2014
#
#
#

node.default.hubot.config = {
                              HUBOT_HIPCHAT_JID: '',
                              HUBOT_HIPCHAT_PASSWORD: '',
                              HUBOT_HIPCHAT_XMPP_DOMAIN: '',
                              HUBOT_HIPCHAT_ROOMS: 'all'
                            }


%w( libexpat1-dev libicu-dev ).each do |pkg|
  package pkg do
    action :install
  end
end

npm_package "hubot-hipchat" do
  path node.hubot.install_dir
  action :install_local
end
