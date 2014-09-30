class ProjectStrongsController < ApplicationController
  before_action :set_project_strong, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /project_strongs
  # GET /project_strongs.json
  def index
    @project_strongs = ProjectStrong.where(user_id: current_user.id)
  end

  # GET /project_strongs/1
  # GET /project_strongs/1.json
  def show
  end

  # GET /project_strongs/new
  def new
    @project_strong = ProjectStrong.new
    @project_strong.user_id = current_user.id
  end

  # GET /project_strongs/1/edit
  def edit
  end

  # POST /project_strongs
  # POST /project_strongs.json
  def create
    @project_strong = ProjectStrong.new(project_strong_params)

    respond_to do |format|
      if @project_strong.save
        format.html { redirect_to project_strongs_path, notice: 'Projekt utworzony pomyślnie' }
        format.json { render :show, status: :created, location: @project_strong }
      else
        format.html { render :new }
        format.json { render json: @project_strong.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_strongs/1
  # PATCH/PUT /project_strongs/1.json
  def update
    respond_to do |format|
      if @project_strong.update(project_strong_params)
        format.html { redirect_to project_strongs_path, notice: 'Project strong was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_strong }
      else
        format.html { render :edit }
        format.json { render json: @project_strong.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_strongs/1
  # DELETE /project_strongs/1.json
  def destroy
    @project_strong.destroy
    respond_to do |format|
      format.html { redirect_to project_strongs_path, notice: 'Project strong was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_strong
      @project_strong = ProjectStrong.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_strong_params
      params.require(:project_strong).permit(:name, :user_id, :description, :project_types_id)
    end
end
