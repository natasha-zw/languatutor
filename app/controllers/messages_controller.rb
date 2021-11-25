class MessagesController < ApplicationController
  before_action :set_conversation
  before_action :set_message_params

  def create
    receipt = current_user.reply_to_conversation(@conversation, params[:body])
    redirect_to conversation_path(receipt.conversation)
  end

  private

  def set_conversation
    @conversation = current_user.mailbox.conversations.find(params[:conversation_id])
  end
  # Only allow a list of trusted parameters through.

  def set_message_params
    params.permit(:authenticity_token, :commit, :body, :conversation_id)
  end
end
