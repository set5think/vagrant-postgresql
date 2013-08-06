#
# Cookbook Name:: postgresql
# Recipe:: plv8
#

require_recipe "postgresql"

v8_version = node["postgresql"]["plv8"]["v8"]["version"]
plv8_download_url = node["postgresql"]["plv8"]["download_url"]

package "build-essential"
package "subversion"
package "git"
package "vim"
package "libreadline-dev"
package "zlib1g-dev"
package "flex"
package "bison"
package "libxml2-dev"
package "libxslt-dev"
package "libssl-dev"
package "libv8-#{v8_version}"
package "libv8-dbg"
package "libv8-dev"

execute "download plv8" do
  command "cd /home && git clone #{plv8_download_url}"
end

execute "make plv8 and create extension" do
  command "cd /home/plv8js && make PG_CONFIG=/usr/bin/pg_config && make install PG_CONFIG=/usr/bin/pg_config && sudo -u postgres /usr/bin/psql -d template1 -c 'CREATE EXTENSION plv8;'"
  # not_if  "test -d /home/plv8js"
end
