class ProjectStrong < ActiveRecord::Base
  belongs_to :project_types
  has_many :group_types, :dependent => :destroy
  has_many :player_strongs, :dependent => :destroy
  has_many :competition_strongs, :dependent => :destroy
  has_many :result_strongs, :dependent => :destroy
  belongs_to :user

  validates_length_of :name, :minimum => 3, :maximum => 35
  validates_length_of :description, :minimum => 0, :maximum => 1000
  validates :project_types_id, :presence => true

end
