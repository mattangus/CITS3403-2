class UpcomingsController < ApplicationController
  include UsersHelper

  def userNew
    upcoming = Upcoming.new

    upcoming.name = upcoming_params[:name]
    upcoming.date = upcoming_params[:date]
    upcoming.tag = upcoming_params[:tag]
    upcoming.external_id = session[:user_id]
    upcoming.id_type = 'user'

    upcoming.save
    redirect_to '/workspace'
  end

  def groupNew
    upcoming = Upcoming.new
    upcoming.name = upcoming_params[:name]
    upcoming.date = upcoming_params[:date]
    upcoming.tag = upcoming_params[:tag]
    upcoming.external_id = :back.
    upcoming.id_type = 'user'

    upcoming.save
  end

  def destroy
  end

  private
  def upcoming_params
    params.require(:upcoming).permit(:name, :date, :tag)
  end
end
