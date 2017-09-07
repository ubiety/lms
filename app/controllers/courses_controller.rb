class CoursesController < ApplicationController
  def index
    @users = Users.all
    authorize @users
  end
end
