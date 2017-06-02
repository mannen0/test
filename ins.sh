#!/bin/bash

sudo apt-get update
sudo apt-get -y install git curl g++ make zlib1g-dev libssl-dev libreadline-dev libyaml-dev libxml2-dev libxslt-dev sqlite3 libsqlite3-dev nodejs
git clone git://github.com/sstephenson/rbenv.git .rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
mkdir -p ~/.rbenv/plugins
cd ~/.rbenv/plugins/
git clone git://github.com/sstephenson/ruby-build.git
rbenv install 2.4.1
echo 'PATH=$HOME/.rbenv/versions/2.4.1/bin/:$PATH' >> ~/.bashrc
cp ~/.bashrc ~/.bashrc.default
gem install rails
bundle install
