#!/usr/bin/env bash

apt-get --quiet --yes update
apt-get --no-install-recommends --quiet --yes install bash curl ruby2.0 ruby2.0-dev bison zlib1g-dev libssl-dev ncurses-dev libreadline-dev git
ln -s /usr/include/x86_64-linux-gnu/ruby-2.0.0/ruby/config.h /usr/include/ruby-2.0.0/ruby/config.h

git clone https://github.com/sstephenson/ruby-build.git /vagrant/build/ruby-build
cd /vagrant/build/ruby-build
./install.sh

# patch for compiling ree's tcmalloc
curl https://gist.github.com/fgrehm/3345650/raw/d0d30531ff380135d6a0154efb7f4f10cd2cc6ca/ree-1.8.7-2012.02 -o /usr/local/share/ruby-build/ree-1.8.7-2012.02

git clone https://github.com/postmodern/chruby.git /vagrant/build/chruby
make install

true
