FROM ruby:2.4.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs npm nodejs-legacy
RUN mkdir /rails_sample
WORKDIR /rails_sample
ADD Gemfile /rails_sample/Gemfile
ADD Gemfile.lock /rails_sample/Gemfile.lock
RUN bundle install
ADD . /rails_sample
RUN mkdir sample
WORKDIR sample
RUN rails new .
