FROM ruby:2.5.1
RUN apt update -qq && apt install -y build-essential  nodejs
RUN gem install rails -v '5.2.0'
RUN mkdir /gps-project
WORKDIR /gps-project
COPY Gemfile /gps-project/Gemfile
COPY Gemfile.lock /gps-project/Gemfile.lock
RUN bundle install
COPY ./gps-project /railsApp
RUN rake db:create
RUN rake db:migrate