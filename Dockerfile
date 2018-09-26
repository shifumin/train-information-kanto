FROM ruby:2.5.1

ENV LANG C.UTF-8
ENV APP_ROOT /app

RUN mkdir -p $APP_ROOT
WORKDIR $APP_ROOT

RUN gem install bundler
COPY Gemfile      Gemfile
COPY Gemfile.lock Gemfile.lock

RUN bundle install

COPY . .
