class DashboardController < ApplicationController
  before_filter "get_project_strong"
  before_action :authenticate_user!
  def index

    if @project_strong.competition_strongs.count!=0
      @compid = @project_strong.competition_strongs.first
      @compid = params[:compid] if params[:compid]

      @competitionName = " - " + @project_strong.competition_strongs.find(@compid).title
      @competitionName = " - " + @project_strong.competition_strongs.find(params[:compid]).title if params[:compid]

    else
      redirect_to project_strong_competition_strongs_path, :alert => "Najperw musisz utworzyć konkurencje."
    end
  end
end
