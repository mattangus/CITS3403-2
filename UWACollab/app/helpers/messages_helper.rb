module MessagesHelper
  def getMessagesByGroup(group)
    return Message.where(group_id: group)
  end
end
