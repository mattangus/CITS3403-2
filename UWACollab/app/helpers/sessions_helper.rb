module SessionsHelper
  def currentUser
    return session[:user_id]
  end

  def login(id, password)
    user = User.find_by_id(id)
    if user and user.authenticate(password)
      session[:user_id] = user.id
    end
  end
end
