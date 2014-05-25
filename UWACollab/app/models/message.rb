class Message < ActiveRecord::Base
  def self.addMessage(params)
    @message = Message.new
    @message.content = params[:content]
    @message.sender_id = 1 #TODO: look up person id with session
    @message.group_id = params[:group_id] #TODO: check if user has access to this group id
    @message.format = 1 #TODO figure out how to set this
    if @message.save
      return @message
    else
      return nil
    end
  end
end
