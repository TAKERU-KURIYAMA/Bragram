# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :reject_user, only: [:create]

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
  def reject_user
    @user = User.find_by(login_ID: params[:user][:login_ID].downcase)
    if @customer

      if (@user.valid_password?(params[:user][:password]) && (@user.active_for_authentication? == false))
        flash[:alert] = "退会済みです"
        redirect_to new_user_session_path
      elsif @user.valid_password?(params[:user][:password]) != true
        flash[:alert] = "パスワードが正しくありません"
      end


    else
      flash[:alert] = "有効なIDではありません"
    end

  end
end
