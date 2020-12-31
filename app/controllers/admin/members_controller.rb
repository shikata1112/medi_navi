class Admin::MembersController < ApplicationController
  before_action :authenticate_admin!

  def top 
    month = (Date.today.beginning_of_month..Date.today).to_a
    number_of_members = month.map { |item| Member.where(created_at: item.beginning_of_day..item.end_of_day).count }
    @graph = Chart.new(month, number_of_members).subscriber_transition
  end

  def index
    @members = Member.all
    respond_to do |format|
      format.html
      format.csv do |csv|
        send_users_csv(@members)
      end
    end
  end

  def send_users_csv(members)
    csv_data = CSV.generate do |csv|
      header = %w(ID 氏名 email 登録日)
      csv << header
      members.each do |member|
        values = [member.id, member.name, member.email, member.created_at]
        csv << values
      end
    end
    send_data(csv_data, filename: '会員一覧情報')
  end

  def show
    @member = Member.find(params[:id])
  end

  def edit
    @member = Member.find(params[:id])
  end
  
end
