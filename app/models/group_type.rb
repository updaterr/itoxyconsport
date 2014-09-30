class GroupType < ActiveRecord::Base
  belongs_to :project_strong
  has_many :player_strongs
  has_many :competition_strong

  validates :name, presence: true, uniqueness: true


end
