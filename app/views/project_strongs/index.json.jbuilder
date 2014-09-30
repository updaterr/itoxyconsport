json.array!(@project_strongs) do |project_strong|
  json.extract! project_strong, :id, :name, :user_id, :description, :project_types_id
  json.url project_strong_url(project_strong, format: :json)
end
