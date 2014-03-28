#!/bin/bash

LATEST_RUBY_VER=$(curl -s "http://cache.ruby-lang.org/pub/ruby/stable/" | sed -E 's/^.*"(ruby-)(2.1.[0-9]+)(.*)".*$/\2/' | sed -e '/^2.1.*/!d' | sort | sed '$!d')
wget http://cache.ruby-lang.org/pub/ruby/stable/ruby-$LATEST_RUBY_VER.tar.gz
tar -xzf ruby-$LATEST_RUBY_VER.tar.gz
rm ruby-$LATEST_RUBY_VER.tar.gz
cd ruby-$LATEST_RUBY_VER
./configure
make
make install
cd ..
rm -rf ruby-$LATEST_RUBY_VER
rm ruby-$LATEST_RUBY_VER.tar.gz
echo 'gem: --no-document' > /etc/gemrc
echo 'gem: --no-document' > ~/.gemrc
gem install bundler
gem install rails