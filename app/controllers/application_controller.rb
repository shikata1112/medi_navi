class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :name, 
      :email, 
      :postcode, 
      :address, 
      :birthday, 
      :sex, 
      :is_deleted,
      :prefecture_name,
      :prefecture_code
      ])
  end

end
