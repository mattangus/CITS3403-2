module UpcomingsHelper
  def new_upcoming
    return Upcoming.new
  end

  def getUpcomingByUser(id)
    return Upcoming.where(external_id: id)
  end

end
