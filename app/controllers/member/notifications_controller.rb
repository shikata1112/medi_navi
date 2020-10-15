class Member::NotificationsController < ApplicationController

  def index
    @notifications = current_member.passive_notifications.page(params[:page]).per(20)

    @notifications.where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end
  end

  def destroy_all
    @notifications = current_member.passive_notifications.destroy_all
    redirect_back(fallback_location: root_path)
  end

end
