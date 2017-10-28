# Users controller
class UsersController < ApplicationController
  before_action :find_user, except: %w[index new create]
  respond_to :html, :js

  def index
    @query = User.ransack(params[:q])
    @users = @query.result.order(:last_name).page params[:page]
    authorize @users
  end

  def show
    authorize @user
  end

  def new
    @user = User.new
    authorize @user
  end

  def create
    @user = User.new(user_params)
    authorize @user
    flash[:success] = 'User created successfully' if @user.save
    respond_with @user
  end

  def edit
    authorize @user
  end

  def update
    authorize @user
    @user.assign_attributes(user_params)
    flash[:success] = 'User updated successfully' if @user.save
    respond_with @user
  end

  def destroy
    authorize @user
    if @user.destroy!
      redirect_to users_path, flash: { success: 'User deleted' }
    else
      redirect_to @user
    end
  end

  private

  def find_user
    @user = User.friendly.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :name, :role, :first_name,
                                 :middle_name, :last_name, :password,
                                 :password_confirmation, :avatar)
  end
end
