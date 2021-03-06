#!/bin/bash

sudo apt-get update
sudo apt-get -y install git curl g++ make zlib1g-dev libssl-dev libreadline-dev libyaml-dev libxml2-dev libxslt-dev sqlite3 libsqlite3-dev nodejs
git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
cp ~/.bashrc ~/.bashrc.default
echo 'export PATH="$HOME/.rbenv/shims:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
#echo 'PATH=$HOME/.rbenv/versions/2.4.1/bin:$PATH' >> ~/.bashrc
export PATH="$HOME/.rbenv/shims:$PATH"
eval "$(rbenv init -)"
#PATH=$HOME/.rbenv/versions/2.4.1/bin:$PATH
mkdir -p ~/.rbenv/plugins
cd ~/.rbenv/plugins/
git clone git://github.com/sstephenson/ruby-build.git
rbenv install 2.4.1
gem install rails
