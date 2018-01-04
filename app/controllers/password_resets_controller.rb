# Password reset controller
class PasswordResetsController < ApplicationController
  def create
    @user = User.find_by_email(params[:email])

    @user.deliver_password_reset_instructions! if @user

    redirect_to login_path, notice: 'Instructions have been sent to your email.'
  end

  def edit
    @token = params[:id]
    @user = User.load_from_password_reset_token(@token)

    not_authenticated if @user.blank?
  end

  def update
    @token = params[:id]
    @user = User.load_from_password_reset_token(@token)

    if @user.blank?
      not_authenticated
      return
    end

    user = params[:user]

    update_password user[:password],
                    user[:password_confirmation]
  end

  private

  def update_password(password, confirmation)
    @user.password_confirmation = confirmation
    if @user.change_password!(password)
      redirect_to login_path, notice: 'Password changed successfully'
    else
      redirect_to action: :edit
    end
  end
end
