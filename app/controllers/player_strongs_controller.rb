class PlayerStrongsController < ApplicationController
  before_action :set_player_strong, only: [:show, :edit, :update, :destroy]
  before_filter "get_project_strong"
  before_action :authenticate_user!

  # GET /player_strongs
  # GET /player_strongs.json
  def index
    @player_strongs = PlayerStrong.where("project_strong_id=#{params[:project_strong_id]}")
    @player_strong = @project_strong.player_strongs.new
  end

  # GET /player_strongs/1
  # GET /player_strongs/1.json
  def show
  end

  # GET /player_strongs/new
  def new
    @player_strong = @project_strong.player_strongs.new
  end

  # GET /player_strongs/1/edit
  def edit
  end

  # POST /player_strongs
  # POST /player_strongs.json
  def create
    @player_strong = @project_strong.player_strongs.new(player_strong_params)
    @player_strongs = PlayerStrong.where("project_strong_id=#{params[:project_strong_id]}")
    respond_to do |format|
      if @player_strong.save
        format.html { redirect_to project_strong_players_groups_path, notice: 'Zawodnik utworzony pomyślnie.' }
        format.js
      else
        format.js
      end
    end
  end

  # PATCH/PUT /player_strongs/1
  # PATCH/PUT /player_strongs/1.json
  def update
    respond_to do |format|
      if @player_strong.update(player_strong_params)
        format.html { redirect_to project_strong_players_groups_path, notice: 'Zawodnik zmieniony pomyślnie.' }
        format.json { head :no_content} # <- best_in_place required
      else
        format.html { render :edit }
        format.json { render json: @player_strong.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /player_strongs/1
  # DELETE /player_strongs/1.json
  def destroy
    @player_strong.destroy
    respond_to do |format|
      format.html { redirect_to project_strong_players_groups_path, notice: 'Zawodnik usunięty pomyślnie.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_player_strong
    @player_strong = PlayerStrong.find(params[:id])
  end


  # Never trust parameters from the scary internet, only allow the white list through.
  def player_strong_params
    params.require(:player_strong).permit(:presence, :project_strong_id, :name, :surname, :photopath, :group_type_id, :city, :country, :old, :weight, :height, :description)
  end
end
