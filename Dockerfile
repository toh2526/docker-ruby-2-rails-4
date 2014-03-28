FROM ubuntu
MAINTAINER Ittipan Langkulanon <toh2526@msn.com>

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

# Install tools & libs to compile everything
RUN apt-get update && apt-get install -y build-essential libssl-dev libreadline-dev wget && apt-get clean

# Download source and Install ruby
LATEST_RUBY_VER=$(curl -s "http://cache.ruby-lang.org/pub/ruby/stable/" | sed -E 's/^.*"(ruby-)(2.1.[0-9]+)(.*)".*$/\2/' | sed -e '/^2.1.*/!d' | sort | sed '$!d')
RUN wget http://cache.ruby-lang.org/pub/ruby/stable/ruby-$LATEST_RUBY_VER.tar.gz
RUN tar -xzf ruby-$LATEST_RUBY_VER.tar.gz
RUN rm ruby-$LATEST_RUBY_VER.tar.gz
RUN cd ruby-$LATEST_RUBY_VER
RUN ./configure
RUN make
RUN make install
RUN cd ..
RUN rm -rf ruby-$LATEST_RUBY_VER
RUN rm ruby-$LATEST_RUBY_VER.tar.gz
RUN echo 'gem: --no-document' > /etc/gemrc
RUN echo 'gem: --no-document' > ~/.gemrc
RUN gem install bundler
RUN gem install rails