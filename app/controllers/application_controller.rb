class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  prepend_before_action :check_captcha, only: [:create]

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

  def check_captcha
    self.resource = resource_class.new sign_up_params
    resource.validate
    unless verify_recaptcha(model: resource)
      respond_with_navigational(resource) { render :new }
    end
  end

  def check_captcha
    self.resource = resource_class.new sign_in_params
    resource.validate
    unless verify_recaptcha(model: resource)
      respond_with_navigational(resource) { render :new }
    end
  end

end
