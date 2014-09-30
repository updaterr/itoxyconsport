class CompetitionStrong < ActiveRecord::Base
  belongs_to :project_strong
  belongs_to :group_type
  has_many :result_strongs

  validates_length_of :title, :minimum => 1
  validates :countrepeat, inclusion: { in: 1..10 }
  validates_presence_of :group_types_id


  #
  # def self.title
  #
  #     groupName = GroupType.find(self.id.to_i).name.to_s
  #     return self.title + " a - " + groupName
  #
  # end
end
