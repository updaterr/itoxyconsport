module ResultStrongsHelper
  def getPlayerStrongNameSurname(playerid)
    playername = @project_strong.player_strongs.find(playerid.to_i)
    return playername.name.to_s + " " +  playername.surname.to_s
  end


end
