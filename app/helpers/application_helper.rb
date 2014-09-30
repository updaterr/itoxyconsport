module ApplicationHelper

  def getCurrentProjectStrongName()
    param1 = params[:project_strong_id].to_i
    param2 = params[:id].to_i

    if ProjectStrong.where(:id => param1).present?
      name = ProjectStrong.find(param1).name
    elsif ProjectStrong.where(:id => param2).present?
      name = ProjectStrong.find(param2).name
    else
      name = "Wybierz projekt"
    end
    return name.to_s
  end

  def getCurrentProjectStrongID()
    param1 = params[:project_strong_id].to_i
    param2 = params[:id].to_i

    if ProjectStrong.where(:id => param1).present?
      name = ProjectStrong.find(param1).id
    elsif ProjectStrong.where(:id => param2).present?
      name = ProjectStrong.find(param2).id
    else
      name = 0
    end
    return name.to_i
  end

  def currentUserProjectsCount()
    if user_signed_in?
      @project_count = ProjectStrong.where(user_id: current_user.id).count
    end
  end


  def nav_link(link_text, link_path)
    class_name = current_page?(link_path) ? 'active' : ''

    content_tag(:li, :class => class_name) do
      link_to link_text, link_path
    end
  end

end
