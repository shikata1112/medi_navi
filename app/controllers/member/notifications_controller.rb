class Member::NotificationsController < ApplicationController
  before_action :authenticate_member!

  def index
    @notifications = current_member.passive_notifications
                                   .eager_load(:visiter)
                                   .page(params[:page])
                                   .per(8)
                                   .order(created_at: "DESC")
    current_member.passive_notifications.update_checked!
  end

  def destroy_all
    @notifications = current_member.passive_notifications.destroy_all
    redirect_back(fallback_location: root_path)
  end

end
