module DashboardHelper

  def getCountAllPlayers()
    @project_strong.player_strongs.count
  end

  def getCountAllCompetitions()
    @project_strong.competition_strongs.count
  end

  def getCountAllResults()
    sum = 0
    sum += @project_strong.result_strongs.sum(:result1)
    sum += @project_strong.result_strongs.sum(:result2)
    sum += @project_strong.result_strongs.sum(:result3)
    sum += @project_strong.result_strongs.sum(:result4)
    sum += @project_strong.result_strongs.sum(:result5)
    sum += @project_strong.result_strongs.sum(:result6)
    sum += @project_strong.result_strongs.sum(:result7)
    sum += @project_strong.result_strongs.sum(:result8)
    sum += @project_strong.result_strongs.sum(:result9)
    sum += @project_strong.result_strongs.sum(:result10)
    return sum
  end

  def getCountAllGroups()
    @project_strong.group_types.count
  end

  def getCountCompetitionResults(competitionID)
    unless competitionID==0
      sum = 0
      sum += @project_strong.result_strongs.where("competition_strong_id = #{competitionID}").sum(:result1)
      sum += @project_strong.result_strongs.where("competition_strong_id = #{competitionID}").sum(:result2)
      sum += @project_strong.result_strongs.where("competition_strong_id = #{competitionID}").sum(:result3)
      sum += @project_strong.result_strongs.where("competition_strong_id = #{competitionID}").sum(:result4)
      sum += @project_strong.result_strongs.where("competition_strong_id = #{competitionID}").sum(:result5)
      sum += @project_strong.result_strongs.where("competition_strong_id = #{competitionID}").sum(:result6)
      sum += @project_strong.result_strongs.where("competition_strong_id = #{competitionID}").sum(:result7)
      sum += @project_strong.result_strongs.where("competition_strong_id = #{competitionID}").sum(:result8)
      sum += @project_strong.result_strongs.where("competition_strong_id = #{competitionID}").sum(:result9)
      sum += @project_strong.result_strongs.where("competition_strong_id = #{competitionID}").sum(:result10)
      return sum
    end
  end


  def getCountCompetitionPlayers(competitionID)
    unless competitionID==0
      @project_strong.result_strongs.where("competition_strong_id = #{competitionID}").count
    end
  end


end
