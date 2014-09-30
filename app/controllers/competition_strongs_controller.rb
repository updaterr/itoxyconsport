class CompetitionStrongsController < ApplicationController
  before_action :set_competition_strong, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_filter 'get_project_strong'

  def index
    @competition_strongs = CompetitionStrong.where("project_strong_id=#{params[:project_strong_id]}")
    @competition_strong = @project_strong.competition_strongs.new
  end

  def show

  end

  def new
    @competition_strong = @project_strong.competition_strongs.new
  end

  def edit

  end

  def create
    @competition_strong = @project_strong.competition_strongs.new(competition_strong_params)
    @competition_strongs = CompetitionStrong.where("project_strong_id=#{params[:project_strong_id]}")

    respond_to do |format|
      if @competition_strong.save
        format.html { redirect_to project_strong_competition_strongs_path, notice: 'Konkurs został utworzony pomyślnie.' }
        format.js
      else
        format.js
      end
    end
  end


  def update
    respond_to do |format|
      if @competition_strong.update(competition_strong_params)
        format.html { redirect_to project_strong_competition_strongs_path, notice: 'Konkurs został zmieniony pomyślnie.' }
        format.json { head :no_content} # <- best_in_place required
      else
        format.html { render :edit }
        format.json { render json: @competition_strong.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @competition_strong.destroy

    respond_to do |format|
      format.html { redirect_to project_strong_competition_strongs_path, notice: 'Konkurs został usunięty pomyślnie.' }
      format.json { head :no_content }
      format.js
    end
  end

  private

  def set_competition_strong
    @competition_strong = CompetitionStrong.find(params[:id])
  end

  def competition_strong_params
    params.require(:competition_strong).permit(:title, :project_strong_id, :group_types_id, :countrepeat)
  end
end
