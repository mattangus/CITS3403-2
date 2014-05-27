class ApplicationController < ActionController::Base
  include MessagesHelper
  include GroupsHelper
  include UsersHelper
  include UpcomingsHelper
  include UserFilesHelper
  include SessionsHelper

  before_action :authorize
  skip_before_action :authorize, only: [:index, :register]

  layout false

  def project
    @userID = session[:user_id]
    @groups = getGroupsByUser(@userID)

    if params[:new]
      render 'projects/new'
    elsif !params[:files]
      group = getGroupByName(params[:name])
      @groupID = group.id
      @users = []
      group.users.to_s.split(';').each do |id|
        @users.append(findUserByID(id))
      end
      @messages = getMessagesByGroup(@groupID)
      render 'projects/index'
    else

    end
  end

  def userEvent
    @upcoming = new_upcoming
    @groups = getGroupsByUser(currentUser)
    render 'upcomings/new'
  end

  def register
    @user = new_user
    render 'users/new'
  end

  def workspace
    @userID = session[:user_id]
    @groups = getGroupsByUser(@userID)
    @upcomings = getUpcomingByUser(@userID)
    @files = getFilesByUserID(@userID)
  end

  def index
    if User.find_by_id(session[:user_id])
      redirect_to workspace_path
    end
    #if request.delete?

   # end
  end

  protected
  def authorize
    unless User.find_by_id(session[:user_id])
      redirect_to login_url, notice: 'Please log in!'
    end
  end

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
