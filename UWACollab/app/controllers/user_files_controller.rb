class UserFilesController < ApplicationController
  include SessionsHelper
  def index
    @user_file = UserFile.all
  end

  def uploadFile
    render 'user_files/new'
  end

  def new
    @user_file = UserFile.new
  end

  def create
    @user_file = UserFile.new(user_file_params)
    @user_file.user_id = currentUser

    if @user_file.save
      redirect_to workspace_path, notice: "The resume #{@user_file.name} has been uploaded."
    else
      render "new"
    end
  end

  def destroy
    @user_file = UserFile.find(params[:id])
    @user_file.destroy
    redirect_to user_file_params, notice:  "The resume #{@user_file.name} has been deleted."
  end

  private
  def user_file_params
    params.permit(:name, :attachment)
  end
end
