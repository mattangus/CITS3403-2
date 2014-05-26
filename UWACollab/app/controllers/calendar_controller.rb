class CalendarController < ApplicationController
  include EventCalendar::CalendarHelper

  def index
    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i

    @shown_month = Date.civil(@year, @month)
    #raise @shown_month.inspect
    @event_strips = Event.event_strips_for_month(@shown_month)
  end
  
end
