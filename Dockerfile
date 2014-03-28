FROM ubuntu
MAINTAINER Ittipan Langkulanon <toh2526@msn.com>

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

# Install tools & libs to compile everything
RUN apt-get update && apt-get install -y build-essential libssl-dev libreadline-dev wget && apt-get clean

# Download source and Install ruby
ADD install-ruby.sh ~/
RUN ~/install-ruby.sh