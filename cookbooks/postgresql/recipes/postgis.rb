#
# Cookbook Name:: postgresql
# Recipe:: postgis
#

require_recipe "postgresql"

geos_version = node["postgresql"]["postgis"]["geos"]["version"]
geos_dir = "geos-#{geos_version}"
geos_filename = "#{geos_dir}.tar.bz2"
geos_download_url = "#{node["postgresql"]["postgis"]["geos"]["download_url"]}/#{geos_filename}"

postgis_version = node["postgresql"]["postgis"]["version"]
postgis_dir = "postgis-#{postgis_version}"
postgis_filename = "#{postgis_dir}.tar.gz"
postgis_download_url = "#{node["postgresql"]["postgis"]["download_url"]}/#{postgis_filename}"

package "libjson0-dev"
package "libarmadillo-dev"
package "libpoppler-dev"
package "libepsilon-dev"
package "libmaloc-dev"
package "liblzma-dev"
package "proj"
package "libgdal1-1.7.0"
package "libgdal1-dev"
package "libgeos-dev"

execute "set up geos" do
  command "cd /home && wget #{geos_download_url} && tar xvfj #{geos_filename} && cd #{geos_dir} && ./configure && make && make install"
  not_if  "test -d /home/#{geos_dir}"
end

execute "setup postgis" do
  command "cd /home && wget #{postgis_download_url} && tar zxf #{postgis_filename} && cd #{postgis_dir} && ./configure && make && make install && /sbin/ldconfig"
end
