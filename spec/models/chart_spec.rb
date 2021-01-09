require 'rails_helper'

RSpec.describe Chart, type: :model do
  describe '#subscriber_transition' do
    before do
      @member1 = create(:member)
      @member2 = create(:guest)
    end

    it "description" do
      month = (Date.today.beginning_of_month..Date.today).to_a
      number_of_members = month.map { |item| Member.where(created_at: item.beginning_of_day..item.end_of_day).count }

      graph = Chart.new(month, number_of_members).subscriber_transition
      
      expect(graph.is_a?(LazyHighCharts::HighChart)).to be true
    end
  end
end