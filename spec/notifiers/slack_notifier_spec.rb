require 'rails_helper'

RSpec.describe SlackNotifier do

  describe "#send" do
    it "HTTPリクエスト(200)が送られているか" do
      expect(SlackNotifier.new.send("hoge").first.code).to eq "200"
    end
  end
end