require 'rails_helper'

RSpec.describe Inquiry, :type => :model do
  describe "delegations" do
    it { is_expected.to delegate_method(:name).to(:member).with_prefix }
    it { is_expected.to delegate_method(:email).to(:member).with_prefix }
  end
end
