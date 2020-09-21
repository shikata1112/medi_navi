class Admin::MembersController < ApplicationController

  def top 
    days = (Date.today.beginning_of_month..Date.today).to_a
    members = days.map { |item| Member.where(created_at: item.beginning_of_day..item.end_of_day).count }
    @graph = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(text: '会員 月間登録推移')
      f.xAxis(categories: days)
      f.series(name: '登録数', data: members)
    end
  end

  def index
    @members = Member.all
  end

  def show
    @member = Member.find(params[:id])
  end

  def edit
    @member = Member.find(params[:id])
  end
end
