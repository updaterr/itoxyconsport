class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :listProjects

  before_action :configure_devise_permitted_parameters, if: :devise_controller? # for extra field in registration=first_name and last_name

  def listProjects
    if user_signed_in?
      @project_lists = ProjectStrong.where(user_id: current_user.id)
    end
  end

  def get_project_strong
    unless ProjectStrong.where("id = #{params[:project_strong_id].to_i} AND user_id = #{current_user.id}").blank?
      @project_strong = ProjectStrong.find(params[:project_strong_id])
    else
      redirect_to project_strongs_path, :alert => "Nie ma takiego konkursu przypisanego do twojego konta."
    end

    #@project_strong = ProjectStrong.where("id = #{params[:project_strong_id]} AND user_id = #{current_user.id}")


  end

  protected

  def configure_devise_permitted_parameters
    registration_params = [:first_name, :last_name, :email, :password, :password_confirmation]

    if params[:action] == 'update'
      devise_parameter_sanitizer.for(:account_update) {
          |u| u.permit(registration_params << :current_password)
      }
    elsif params[:action] == 'create'
      devise_parameter_sanitizer.for(:sign_up) {
          |u| u.permit(registration_params)
      }
    end
  end

end