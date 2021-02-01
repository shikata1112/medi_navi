require 'rails_helper'

RSpec.describe SlackNotifier do

  describe "#send" do
    it "エラーなくslackで通知が送られているか" do
      expect{ SlackNotifier.new.send("hoge") }.not_to raise_error
    end
  end
end