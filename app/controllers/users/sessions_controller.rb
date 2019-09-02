# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  def create
    auth = request.env["omniauth.auth"]
    if auth.present?
    unless @auth = Authorization.find_from_auth(auth)
    @auth = Authorization.create_from_auth(auth)
    end
    user = @auth.user
    redirect_back_or user
    else
    #もしすでに認証機能がある場合ここに自前の認証機能をいれる
    #ない場合はこのelseブロックはいらないので削除
    end
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

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
