#
# Cookbook Name:: chub_hubot
# Recipe:: default
#
# Copyright (C) 2014
#
#
#

node.default.hubot.scripts_version = '2.5.15'
node.default.hubot.version = '2.6.0'
node.default.hubot.adapter = 'hipchat'
node.default.hubot.hubot_scripts = ['beerme.coffee']
node.default.hubot.config = { name: 'Chubbot'}


# Magic

#include adapter recipe

include_recipe 'hubot'
