# Users controller
class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if user.save!
      redirect_to @user, flash: { success: 'User signed up successfully' }
    else
      render :new
    end
  end

  private

  def user_params
    require(:user).permit(:email, :name, :role, :password,
                          :password_confirmation, :first_name, :middle_name,
                          :last_name)
  end
end
