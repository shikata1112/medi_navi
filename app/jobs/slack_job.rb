class SlackJob < ApplicationJob
  queue_as :default

  def perform
    SlackNotifier.new.send("問い合わせがありました！")
  end
end
