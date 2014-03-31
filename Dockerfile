FROM ubuntu
MAINTAINER Ittipan Langkulanon <toh2526@msn.com>

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

# Install tools & libs to compile everything
RUN apt-get update && apt-get install -y build-essential libssl-dev libreadline-dev wget && apt-get clean

# Download source and Install ruby
ADD install-ruby.sh /root/
RUN chmod 700 /root/install-ruby.sh
RUN /root/install-ruby.sh
RUN rm /root/install-ruby.sh