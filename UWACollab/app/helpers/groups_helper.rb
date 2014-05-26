module GroupsHelper
  def getGroupByName(n)
    return Group.find_by(name: n)
  end
  def getGroupsByUser(p)
    search = Group.where('users like ?', "%#{p}%")
    groups = []
    search.each do |g|
      sp = g.users.to_s.split(';')
      if sp.include? p.to_s
        groups.append g
      end
    end
    return groups
  end
end
