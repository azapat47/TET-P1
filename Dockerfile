FROM ruby:2.5.1

MAINTAINER Andrés Felipe Zapata Palacio - azapat47@eafit.edu.co

RUN apt-get update -qq && apt-get install -y apt-utils build-essential  nodejs
RUN gem install rails -v '5.2.0'
RUN mkdir /gps-project
WORKDIR /gps-project
COPY ./gps-project/Gemfile /gps-project/Gemfile
COPY ./gps-project/Gemfile.lock /gps-project/Gemfile.lock
RUN bundle install
COPY ./gps-project /gps-project
