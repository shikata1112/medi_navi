class Admin::MembersController < ApplicationController
  before_action :authenticate_admin!

  def top 
    month = (Date.today.beginning_of_month..Date.today).to_a
    number_of_members = month.map { |item| Member.where(created_at: item.beginning_of_day..item.end_of_day).count }
    @graph = Chart.new(month, number_of_members).subscriber_transition
  end

  def index
    @members = Member.all
    respond_format
  end

  def show
    @member = Member.find(params[:id])
  end

  def edit
    @member = Member.find(params[:id])
  end

  private

  def respond_format
    respond_to do |format|
      format.html
      format.csv { send_users_csv }
    end
  end

  def send_users_csv
    send_data(Member.csv_values, filename: '会員一覧情報')
  end
  
end
