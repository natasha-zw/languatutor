class ConversationsController < ApplicationController
  before_action :set_conversation_params
  def index
    @conversations = current_user.mailbox.conversations
  end

  def show
    @conversation = current_user.mailbox.conversations.find(params[:id])
    @conversation.participants.each do |user|
      if user.id != current_user.id
        @recipient = user
      end
    end
  end

  def new
    @recipient = User.find(params[:id])
  end

  def create
    recipient = User.find(params[:user_id])
    receipt = current_user.send_message(recipient, params[:body], params[:subject])
    redirect_to conversation_path(receipt.conversation)
  end

  private

  def set_conversation_params
    params.permit(:authenticity_token, :commit, :body, :subject, :id)
  end

end
