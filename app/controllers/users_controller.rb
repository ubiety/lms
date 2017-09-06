# Users controller
class UsersController < ApplicationController
  def index
    @users = User.all
    authorize @users
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def new
    @user = User.new
    authorize @user
  end

  def create
    @user = User.create(user_params)
    if @user.save!
      redirect_to @user, flash: { success: 'User signed up successfully' }
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user

    @user.assign_attributes(user_params)

    if @user.save!
      redirect_to @user, flash: { success: 'User saved' }
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    authorize @user
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :role, :first_name,
                                 :middle_name, :last_name, :password,
                                 :password_confirmation)
  end
end
