class Member::NotificationsController < ApplicationController
  before_action :authenticate_member!

  def index
    @notifications = current_member.passive_notifications.eager_load(:visiter).page(params[:page]).per(8)
    @notifications.where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end
  end

  def destroy_all
    @notifications = current_member.passive_notifications.destroy_all
    redirect_back(fallback_location: root_path)
  end

end
