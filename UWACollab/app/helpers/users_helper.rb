module UsersHelper
  def new_user
    return User.new
  end
  def findUserByEmail(email)
    return User.find_by_email(email)
  end
end
