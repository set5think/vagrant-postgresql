#
# Cookbook Name:: postgresql
# Recipe:: dev
#

require_recipe "postgresql"

package "postgresql-server-dev-#{node["postgresql"]["version"]}"
