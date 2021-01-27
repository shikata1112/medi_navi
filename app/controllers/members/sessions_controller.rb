# frozen_string_literal: true

class Members::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end


  # ゲストログイン
  def new_guest
    member = Member.find(2)
    member.update(:email => 'guest@gmail.com', :name => 'ゲスト') do |member|
      member.password = SecureRandom.urlsafe_vase64
    end
    sign_in member
    redirect_to root_path
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  def after_sign_out_path_for(resource)
    new_member_session_path
  end

  def after_sign_in_path_for(resource)
    root_path
  end

  # Recaptcha
  prepend_before_action :check_captcha, :only => [:create]

  def check_captcha
    self.resource = resource_class.new sign_in_params
    resource.validate
    unless verify_recaptcha(:model => resource)
      respond_with_navigational(resource) { render :new }
    end
  end

  # 会員論理削除
  def reject_member
    @member = Member.find_by(:email => params[:member][:email].downcase)
    if @member
      if (@member.valid_password?(params[:member][:password]) && (@member.active_for_authentication? == false))
        flash[:error] = "このアカウントは退会済みです。"
        redirect_to new_member_session_path
      end
    else
      flash[:error] = "必須項目を入力してください。"
    end
  end

end
