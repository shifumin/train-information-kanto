# frozen_string_literal: true

require 'slack-ruby-client'
require 'train_info_kanto'

Slack.configure do |config|
  config.token = ENV['SLACK_API_TOKEN']
end

texts = TrainInfoKanto.get(%w[山手線 京浜東北線 中央線 中央総武線 総武快速線 内房線 京葉線 千代田線])
client = Slack::Web::Client.new

texts.each do |text|
  client.chat_postMessage(channel: '#test', text: text, as_user: true)
end
