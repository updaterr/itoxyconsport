class ProjectTypes < ActiveRecord::Base
  has_many :project_strongs

  validates :name, :uniqueness => true
  validates_length_of :name, :minimum => 3, :maximum => 15
end
