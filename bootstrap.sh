# #!/usr/bin/env bash
# 
# if [ ! -f ~/.runonce ]; then
#   sudo apt-get update
#   sudo apt-get install -y build-essential subversion git vim libpq-dev postgresql-server-dev-9.2
#   sudo apt-get install -y libreadline-dev zlib1g-dev flex bison libxml2-dev libxslt-dev libssl-dev libv8-3.7.12.22 libv8-dbg libv8-dev
#   sudo apt-get install -y libjson0-dev libarmadillo-dev libpoppler-dev libepsilon-dev libmaloc-dev liblzma-dev postgresql-plpython-9.2 proj libgdal1-1.7.0 libgdal1-dev libgeos-dev
# 
#   # install postgres
#   # wget http://ftp.postgresql.org/pub/source/v9.3beta2/postgresql-9.3beta2.tar.gz
#   # tar -xzf postgresql-9.3beta2.tar.gz
#   # cd postgresql-9.3beta2
#   # ./configure
#   # make
#   # sudo make install
# 
#   # sudo adduser --disabled-password  -gecos "" postgres
#   # sudo mkdir /usr/local/pgsql/data
#   # sudo mkdir /usr/local/pgsql/logs
#   # sudo chown postgres /usr/local/pgsql/data
#   # sudo chown postgres /usr/local/pgsql/logs
#   # #/usr/local/pgsql/bin/initdb -D /usr/local/pgsql/data
#   # sudo -u postgres /usr/local/pgsql/bin/initdb --locale=en_US.UTF-8 --encoding=UNICODE -D /usr/local/pgsql/data
#   # #/usr/local/pgsql/bin/postgres -D /usr/local/pgsql/data >logfile 2>&1 &
# 
#   # # prepare postgres for incoming data connections from host
#   # sudo -u postgres sed '85ihost all all 0.0.0.0/0 trust' /usr/local/pgsql/data/pg_hba.conf | sudo tee /usr/local/pgsql/data/pg_hba.conf > /dev/null
#   # sudo -u postgres sed "59ilisten_addresses = \\\\'*\\\\'" /usr/local/pgsql/data/postgresql.conf | sudo tee /usr/local/pgsql/data/postgresql.conf > /dev/null
# 
#   # sudo -u postgres /usr/local/pgsql/bin/pg_ctl -D /usr/local/pgsql/data -l /usr/local/pgsql/logs/pgsql.log start
# 
#   # #/usr/local/pgsql/bin/createdb test
#   #/usr/local/pgsql/bin/psql test
#   #sudo -u postgres echo PATH=/usr/local/pgsql/bin:$PATH >> ~/.bashrc
#   # sudo su postgres -c "echo PATH=/usr/local/bin:$PATH >> ~/.bashrc"
#   # echo PATH=/usr/local/pgsql/bin:$PATH >> ~/.bashrc
#   # source ~/.bashrc
# 
#   # install v8
#   # cd ../
#   # svn checkout http://v8.googlecode.com/svn/trunk/ v8
#   # cd v8
#   # make dependencies
#   # make native library=shared
#   # sudo cp out/native/lib.target/libv8.so /usr/lib
# 
#   # install postgis 2.0
#   #geos first
#   cd /home
#   wget http://download.osgeo.org/geos/geos-3.3.8.tar.bz2
#   tar xvfj geos-3.3.8.tar.bz2
#   cd geos-3.3.8
#   ./configure
#   make
#   make install
# 
#   #now postgis
#   cd /home
#   wget http://download.osgeo.org/postgis/source/postgis-2.0.3.tar.gz
#   tar zxf postgis-2.0.3.tar.gz
#   cd postgis-2.0.3
#   ./configure
#   make
#   make install
#   /sbin/ldconfig
# 
#   # install plv8
#   cd ../
#   git clone https://code.google.com/p/plv8js/
#   cd plv8js
#   make PG_CONFIG=/usr/bin/pg_config
#   make install PG_CONFIG=/usr/bin/pg_config
# 
#   # instantiate plv8 extension
#   sudo -u postgres /usr/bin/psql -d template1 -c "CREATE EXTENSION plv8;"
# 
#   # install postsql extensions
#   cd ../
#   git clone https://github.com/tobyhede/postsql.git
#   sudo -u postgres /usr/bin/psql -d template1 -f postsql/postsql.sql
#   touch ~/.runonce
# else
#   sudo -u postgres /usr/bin/pg_ctl -D /var/lib/postgresql/9.2/main -l /var/log/postgresql/postgresql-9.2-main.log start
# fi
