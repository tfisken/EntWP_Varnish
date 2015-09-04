#
# Cookbook Name:: varnish_support
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe 'varnish'
include_recipe 'iptables'

iptables_rule 'varnish' do
  source 'iptables'
end
