class SlackNotifier

  def send(message)
    Slack::Notifier.new(ENV['WEBHOOK_URL']).ping(message)
  end
end