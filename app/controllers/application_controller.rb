# Application controller
#  Base for all controllers
class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  before_action :require_login, :set_locale, :set_paper_trail_whodunnit, :load_conversations

  responders :flash

  def default_url_options
    { locale: I18n.locale }
  end

  def not_authenticated
    redirect_to login_path
  end

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def load_conversations
    if current_user
      @conversations = Conversation.participating(current_user).order('updated_at DESC')
    end
  end
end
