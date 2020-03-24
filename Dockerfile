# https://hub.docker.com/_/ruby
FROM ruby:2.6.5-buster

ENV WORKDIR /app
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -qq -y --no-install-recommends apt-utils 2>/dev/null
RUN apt-get install -qq -y --fix-missing --no-install-recommends build-essential nodejs git curl apt-transport-https

ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE 1
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -qq -y --fix-missing --no-install-recommends yarn

RUN gem install bundler

RUN mkdir -p $WORKDIR
WORKDIR $WORKDIR

