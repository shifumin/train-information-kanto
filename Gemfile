# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.2'

gem 'slack-ruby-client'
gem 'traininfo_kanto'

group :development, :test do
  gem 'awesome_print'
  gem 'pry-byebug'
  gem 'pry-stack_explorer'
  gem 'tapp'
end

group :development do
  gem 'rubocop', require: false
end
