class ApplicationController < ActionController::Base
  include MessagesHelper
  include GroupsHelper
  #before_action :authorize

  def project
    @userID = 1 #session[:user_id]
    @groupID = getGroupByName(params[:name]).id
    @messages = getMessagesByGroup(@groupID)
    render 'projects/index'
  end

  def register

  end

  def workspace

  end

  def index
    raise "RAISE"
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
