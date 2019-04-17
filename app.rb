# frozen_string_literal: true

require 'slack-ruby-client'
require 'traininfo_kanto'

Slack.configure do |config|
  config.token = ENV['SLACK_API_TOKEN']
end

texts = TraininfoKanto.get(%w[山手線 京浜東北線 横須賀線 中央線 中央総武線 総武快速線 内房線 京葉線 丸ノ内線 有楽町線], url: true)
client = Slack::Web::Client.new

texts.each do |text|
  client.chat_postMessage(channel: '#bot', text: text, as_user: true)
end
