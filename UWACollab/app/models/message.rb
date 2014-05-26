class Message < ActiveRecord::Base
  include SessionsHelper

  belongs_to :group
  belongs_to :user, :foreign_key => :sender_id

  def self.addMessage(params, sender)
    @message = Message.new
    @message.content = params[:content]
    @message.sender_id = sender
    @message.group_id = params[:group_id]
    @message.format = 1 #TODO figure out how to set this
    if @message.save
      return @message
    else
      return nil
    end
  end
end
