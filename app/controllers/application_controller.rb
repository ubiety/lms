# Application controller
#  Base for all controllers
class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  before_action :require_login, :set_locale, :set_paper_trail_whodunnit

  responders :flash

  def self.default_url_options
    { locale: I18n.locale }
  end

  def not_authenticated
    redirect_to login_path
  end

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
