module GroupsHelper
  def getGroupByName(n)
    return Group.find_by(name: n)
  end
end
