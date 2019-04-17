FROM ruby:2.6.2-alpine

ENV LANG C.UTF-8

RUN mkdir /app
WORKDIR /app

RUN apk update && \
    apk upgrade && \
    apk add --update --no-cache \
        ruby-dev \
        build-base

RUN gem install bundler --no-document && \
    gem update --system

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install --jobs=4 --no-cache

COPY . .
