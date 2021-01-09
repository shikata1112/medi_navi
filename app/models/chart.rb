class Chart

  def initialize(month, number_of_members)
    @month = month
    @number_of_members = number_of_members
  end

  def subscriber_transition
    LazyHighCharts::HighChart.new('graph') do |f|
      f.title(text: '会員 月間登録推移')
      f.xAxis(categories: @month)
      f.series(name: '登録数', data: @number_of_members)
    end
  end
end