class PlayerStrong < ActiveRecord::Base
  belongs_to :project_strong
  belongs_to :group_type
  has_many :result_strongs

  validates_length_of :name, :minimum => 1, :maximum => 20
  validates_length_of :surname, :minimum => 1, :maximum => 20
  validates_length_of :city, :minimum => 1, :maximum => 20
  validates_length_of :country, :minimum => 1, :maximum => 20
  validates :old, inclusion: { in: 1..120 }
  validates :weight, inclusion: { in: 1..400 }
  validates :height, inclusion: { in: 1..300 }
  validates_length_of :description, :minimum => 0, :maximum => 1000

  validates :group_type_id, :presence => true
end
