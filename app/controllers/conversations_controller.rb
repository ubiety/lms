# Conversation controller
class ConversationsController < ApplicationController
  def index
    @chats = Conversation.includes(:receiver).where('author_id = ?', current_user.id)
    respond_to do |format|
      format.json { render json: @chats, include: { receiver: { only: :first_name } } }
    end
  end
end
