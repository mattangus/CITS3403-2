class GroupsController < ApplicationController
  include UsersHelper
  layout false

  def new
    group = Group.new
    users = [session[:user_id]]
    group_params[:people].to_s.split('\r\n').each do |email|
      found = findUserByEmail(email)
      if found
        users.append found.id
      end
    end
    if users.length > 1
      group.users = users.join(';')
    else
      group.users = users[0]
    end
    group.name = group_params[:name]
    if !group.save
      @errors = group.errors
      redirect_to newProject_path
    end
    redirect_to workspace_path
  end

  def update
    group = Group.getGroupByName
    respond_to do |format|
      if group.update(group_params)
        format.html { redirect_to group, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: group }
      else
        format.html { render :edit }
        format.json { render json: group.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def group_params
    params.require(:project).permit(:name, :people)
  end
end
