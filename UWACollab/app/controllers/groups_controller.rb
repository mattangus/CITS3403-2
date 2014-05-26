class GroupsController < ApplicationController
  include UsersHelper
  def new
    group = Group.new
    users = [session[:user_id]]
    group_params[:people].to_s.split('\r\n').each do |email|
      found = findUserByEmail(email)
      if found
        users.append found
      end
    end
    if users.length > 1
      group.users = users.join(';')
    else
      group.users = users[0]
    end
    group.name = group_params[:name]
    redirect_to workspace_path
  end

  private
  def group_params
    params.require(:project).permit(:name, :people)
  end
end
