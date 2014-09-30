module ResultViewHelper

  def generateTitleGroup
    title = ProjectStrong.find(params[:projectid]).competition_strongs.find(params[:competitionid]).title
    groupid = ProjectStrong.find(params[:projectid]).competition_strongs.find(params[:competitionid]).group_types_id
    groupName = ProjectStrong.find(params[:projectid]).group_types.find(groupid).name
    return title + " - " + groupName
  end

  def generateGroup
    groupid = ProjectStrong.find(params[:projectid]).competition_strongs.find(params[:competitionid]).group_types_id
    groupName = ProjectStrong.find(params[:projectid]).group_types.find(groupid).name
    return groupName
  end

  def getCounts
    ProjectStrong.find(params[:projectid]).competition_strongs.find(params[:competitionid]).countrepeat
  end

  def getPlayerStrongNameSurname(playerid)
    playername =  PlayerStrong.find(playerid.to_i)
    return playername.name.to_s + " " +  playername.surname.to_s
  end

  def get3bestingroup
    # groupid = ProjectStrong.find(params[:projectid]).competition_strongs.find(params[:competitionid]).group_types_id
    ProjectStrong.find(params[:projectid]).result_strongs.where("competition_strong_id = #{params[:competitionid]}").each do |record|
      ResultStrong.where("player_strong_id= #{record.player_strong_id}")
    end

    # kazdemu zawodnikowi pobierz maxvalue gdy result1ok==true
    # max zawodnika w tabeli

    # gdy zawodnik nalezy do grupy x dodaj na liste
    # sortuj rosnaco
    # utnij to 3 wynikow


    return "<p>1. </p>" + "<p>2. </p>" + "<p>3. </p>"
  end

end
