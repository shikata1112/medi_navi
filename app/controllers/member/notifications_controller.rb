class Member::NotificationsController < ApplicationController
  before_action :authenticate_member!

  def index
    @notifications = current_member.passive_notifications
                                   .eager_load(:visiter)
                                   .page(params[:page])
                                   .per(8)
    @notifications.update_attributes!(@notifications)
  end

  def destroy_all
    @notifications = current_member.passive_notifications.destroy_all
    redirect_back(fallback_location: root_path)
  end

end
