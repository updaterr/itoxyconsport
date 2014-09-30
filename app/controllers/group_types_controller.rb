class GroupTypesController < ApplicationController
  before_action :set_group_type, only: [:show, :edit, :update, :destroy]
  before_filter 'get_project_strong'
  before_action :authenticate_user!

  # GET /group_types
  # GET /group_types.json
  def index
    @group_types = GroupType.where("project_strong_id=#{params[:project_strong_id]}")
    @group_type = @project_strong.group_types.new
  end

  # GET /group_types/1
  # GET /group_types/1.json
  def show

  end

  # GET /group_types/new
  def new
    @group_type = @project_strong.group_types.new #maybe build(params[:chapter])
  end

  # GET /group_types/1/edit
  def edit
  end

  # POST /group_types
  # POST /group_types.json
  def create
    @group_type = @project_strong.group_types.new(group_type_params)#GroupType.new(group_type_params)
    @group_types = GroupType.where("project_strong_id=#{params[:project_strong_id]}")

    respond_to do |format|
      if @group_type.save
        format.html { redirect_to project_strong_players_groups_path, notice: 'Grupa została utworzona pomyślnie' }
        format.js
      else
        format.js
      end
    end
  end

  # PATCH/PUT /group_types/1
  # PATCH/PUT /group_types/1.json
  def update
    respond_to do |format|
      if @group_type.update(group_type_params)
        format.html { redirect_to project_strong_players_groups_path, notice: 'Grupa została zmieniona pomyślnie.' }
        format.json { head :no_content} # <- best_in_place required
      else
        format.html { render :edit }
        format.json { render json: @group_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /group_types/1
  # DELETE /group_types/1.json
  def destroy
    @group_type.destroy

    respond_to do |format|
      format.html { redirect_to project_strong_players_groups_path, notice: 'Grupa zniszczona pomyślnie.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group_type
      @group_type = GroupType.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def group_type_params
      params.require(:group_type).permit(:name, :project_strong_id)
    end
end
