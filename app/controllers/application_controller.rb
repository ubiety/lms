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
    case current_user.role
    when User.roles[:student]
      'student'
    when User.roles[:instructor]
      'instructor'
    when User.roles[:admin]
      'admin'
    end
  end
end
