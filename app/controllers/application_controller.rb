# Application controller
#  Base for all controllers
class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  before_action :require_login
  layout :layout_for_role

  def not_authenticated
    redirect_to login_path
  end

  private

  def layout_for_role
    if current_user.admin?
      'admin'
    elsif current_user.instructor?
      'instructor'
    elsif current_user.student?
      'student'
    else
      'application'
    end
  end
end
