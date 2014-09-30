module ProjectStrongsHelper
  def getProjectTypesName(projectid)
    typename = ProjectTypes.find(projectid.to_i)
    return typename.name
  end
end
