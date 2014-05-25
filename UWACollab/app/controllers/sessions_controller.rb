class SessionsController < ApplicationController
  def new
  end

  def create
    raise('raised')
    user = User.find_by_email(params[:email])
    raise(user.inspect)
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to 'application/workspace'
    else
      redirect_to login_url, :alert => 'Invalid user/password combination'
    end
  end
  def destroy
    session[:user_id] = nil
    redirect_to login_url, :notice => 'logged out'
  end
end
