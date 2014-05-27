module UserFilesHelper
  def getFilesByUserID(id)
    return UserFile.where(user_id: id)
  end
end
