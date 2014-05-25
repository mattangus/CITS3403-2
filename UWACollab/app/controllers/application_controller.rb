class ApplicationController < ActionController::Base
  include UsersHelper
  #before_action :authorize

  def project

  end

  def register
    @user = new_user
    render 'users/new'
  end

  def workspace

  end

  def index
    if request.delete?

    end
  end

  protected
  def authorize
    unless User.find_by_id(session[:user_id])
      redirect_to login_url, notice: "Please log in"
    end
  end

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
