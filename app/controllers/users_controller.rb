# Users controller
class UsersController < ApplicationController
  before_action :find_user, except: %w[index new create]

  def index
    @query = User.ransack(params[:q])
    @users = @query.result.order(:last_name).page params[:page]
    @user = User.new
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
    @user = User.create(user_params)
    authorize @user
    if @user.save!
      respond_to do |format|
        format.html { redirect_to @user, flash: { success: 'User created successfully' } }
        format.js
      end
    else
      render :new
    end
  end

  def edit
    authorize @user
  end

  def update
    authorize @user
    @user.assign_attributes(user_params)
    if @user.save!
      redirect_to @user, flash: { success: 'User saved' }
    else
      render :edit
    end
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
