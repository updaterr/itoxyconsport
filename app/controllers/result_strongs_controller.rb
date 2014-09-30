class ResultStrongsController < ApplicationController
  before_action :set_result_strong, only: [:show, :edit, :update, :destroy]
  before_filter 'get_project_strong'
  before_action :authenticate_user!

  # GET /result_strongs
  # GET /result_strongs.json
  def index

    @result_strong = @project_strong.result_strongs.new #czy to potrzebne?

    @result_strongs = ResultStrong.where("project_strong_id=#{params[:project_strong_id]}")
    @filtername = "Wszystkie"
    @repeatscounts = 10


    @result_strongs = ResultStrong.where("project_strong_id=#{params[:project_strong_id]} AND competition_strong_id=#{params[:compid]}") if params[:compid]
    @filtername = CompetitionStrong.find(params[:compid]).title if params[:compid]
    @repeatscounts = CompetitionStrong.find(params[:compid]).countrepeat if params[:compid]


    checkCreateReultsForPlayers(params[:compid].to_i)

  end

  # GET /result_strongs/1
  # GET /result_strongs/1.json
  def show
  end

  # GET /result_strongs/new
  def new
    @result_strong = @project_strong.result_strongs.new
  end

  # GET /result_strongs/1/edit
  def edit
  end

  # POST /result_strongs
  # POST /result_strongs.json
  def create
    @result_strong =  @project_strong.result_strongs.new(result_strong_params)
    @result_strongs = ResultStrong.where("project_strong_id=#{params[:project_strong_id]}")

    respond_to do |format|
      if @result_strong.save
        format.html { redirect_to project_strong_result_strongs_path, notice: 'Result strong was successfully created.' }
        format.js
      else
        format.html { render :new }
        format.js
      end
    end
  end

  # PATCH/PUT /result_strongs/1
  # PATCH/PUT /result_strongs/1.json
  def update
    respond_to do |format|
      if @result_strong.update(result_strong_params)
        format.html { redirect_to project_strong_result_strongs_path, notice: 'Rezultat zmieniony pomyślnie' }
        format.json { head :no_content} # <- best_in_place required
      else
        format.html { render :edit }
        format.json { render json: @result_strong.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /result_strongs/1
  # DELETE /result_strongs/1.json
  def destroy
    @result_strong.destroy
    respond_to do |format|
      format.html { redirect_to project_strong_result_strongs_path, notice: 'Result strong was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_result_strong
    @result_strong = ResultStrong.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def result_strong_params
    params.require(:result_strong).permit(:competition_strong_id, :project_strong_id, :player_strong_id, :result1, :result1ok, :result2, :result2ok, :result3, :result3ok, :result4, :result4ok, :result5, :result5ok, :result6, :result6ok, :result7, :result7ok, :result8, :result8ok, :result9, :result9ok, :result10, :result10ok)
  end

  def checkCreateReultsForPlayers(competitionid)
    if @project_strong.competition_strongs.count!=0
      competitionid=@project_strong.competition_strongs.last.id if competitionid==0
      competition = @project_strong.competition_strongs.find(competitionid)

      @project_strong.player_strongs.where("group_type_id = #{competition.group_types_id}").each do |player|
        if @project_strong.result_strongs.where("player_strong_id = #{player.id} AND competition_strong_id = #{competition.id}").blank?
          ResultStrong.create(:competition_strong_id => params[:compid], :project_strong_id => params[:project_strong_id], :player_strong_id => player.id)
        end
      end
    end
  end

end
