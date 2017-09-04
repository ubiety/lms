# Sessions controller
# used to sign a user in and out
class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if (@user = login(params[:email], params[:password], params[:remember_me]))
      redirect_back_or_to(:users, success: 'Logged in successfully')
    else
      Flash.now[:error] = 'Login failed'
      render action: :new
    end
  end

  def destroy
    logout
    redirect_to(:users, success: 'Logged out successfully')
  end
end
