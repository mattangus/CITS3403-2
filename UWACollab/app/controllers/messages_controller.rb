class MessagesController < ApplicationController
  include SessionsHelper

  layout false

  def create
    @groupID = message_params[:group_id]
    @userID = currentUser
    respond_to do |format|
        format.html
        format.js {
          @messageSent = Message.addMessage(message_params,currentUser)
        }
      end
  end

  def index
    @messages = Message.all.order('chats.created_at')
    @groupID = params[:group_id]
    @userID = currentUser #TODO lookup in user table
    respond_to do |format|
      format.html { }
      format.js { @messages = Message.where('group_id = ? and created_at > ? and sender_id != ?', params[:group_id], Time.at(params[:after].to_i + 1), @userID)}
    end
  end

  private
  def message_params
    params.require(:message).permit(:content, :group_id)
  end
end
