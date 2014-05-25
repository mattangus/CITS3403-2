class SessionsController < ApplicationController
  skip_before_action :authorize, only: [:create, :new]

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/workspace'
    else
      redirect_to login_url, :alert => 'Invalid user/password combination'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url, :notice => 'logged out'
  end
end
