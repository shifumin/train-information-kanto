# frozen_string_literal: true

require 'slack-ruby-client'
require 'traininfo_kanto'

Slack.configure do |config|
  config.token = ENV['SLACK_API_TOKEN']
end

texts = TraininfoKanto.get(%w[山手線 京浜東北線 横須賀線 中央線 中央総武線 総武快速線 内房線 京葉線 丸ノ内線 有楽町線], url: true)
client = Slack::Web::Client.new

# FIXME: gemのレスポンスを適切に修正した上で1つのmessageに収まるようにpostする
client.chat_postMessage(channel: '#bot', text: texts.join("\n"), as_user: true)
