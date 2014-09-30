class ResultStrong < ActiveRecord::Base
  belongs_to :project_strong
  belongs_to :competition_strong
  belongs_to :player_strong

  validates :competition_strong_id, :presence => true
  validates :project_strong_id, :presence => true
  validates :player_strong_id, :presence => true



end
